import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:harmonized_admin/src/models/user_model.dart';

class UserServices {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Stream current user details
  Stream<UserModel>? streamUser() {
    try {
      return firestore
          .collection("users")
          .doc(auth.currentUser?.uid)
          .snapshots()
          .map((snapshot) {
        if (snapshot.exists) {
          return UserModel.fromJson(snapshot.data()!);
        } else {
          return UserModel();
        }
      });
    } catch (e) {
      print("Error streaming user: $e");
      return null;
    }
  }

  // Stream all users except the current user
  Stream<List<UserModel>> streamAllUsers() {
    try {
      return firestore.collection("users").snapshots().map((querySnapshot) {
        final users = querySnapshot.docs
            .where((doc) {
              return doc.id != auth.currentUser?.uid;
            })
            .map((doc) {
              final data = doc.data();
              print('Fetched user data: ${data.toString()}');
              return UserModel.fromJson(data);
            })
            .toList()
            .where((user) => !user.blockedUserIds!
                .contains(auth.currentUser?.uid)) // Exclude blocked users
            .toList();
        print('All users: ${users.toString()}');
        return users;
      });
    } catch (e) {
      print("Error streaming all users: $e");
      return Stream.value([]); // Return empty list on error
    }
  }

  // Method to update user data in Firebase
  Future<void> updateUser(UserModel updatedUser) async {
    try {
      await firestore
          .collection("users")
          .doc(auth.currentUser?.uid)
          .update(updatedUser.toJson());
    } catch (e) {
      print("Error updating user: $e");
    }
  }

  // Fetch potential matches where the current user's uid is in interestedIn field
  Stream<List<UserModel>> streamPotentialMatches() {
    try {
      final currentUserUid = auth.currentUser?.uid;
      return firestore
          .collection("users")
          .where("interested_in", arrayContains: currentUserUid)
          .snapshots()
          .map((querySnapshot) {
        return querySnapshot.docs
            .map((doc) => UserModel.fromJson(doc.data()))
            .toList();
      });
    } catch (e) {
      print("Error fetching potential matches: $e");
      return Stream.value([]); // Return empty list on error
    }
  }

  // Add current user's ID to the interestedIn field of another user
  Future<void> addToInterestedIn(String? likedUserId) async {
    try {
      final currentUserUid = auth.currentUser?.uid;
      await firestore.collection("users").doc(likedUserId).update({
        'interested_in': FieldValue.arrayUnion([currentUserUid])
      });
    } catch (e) {
      print("Error adding to interested_in: $e");
    }
  }

  Future<void> addToNotInterested(String userId) async {
    try {
      await firestore.collection("users").doc(auth.currentUser?.uid).update({
        'notInterested': FieldValue.arrayUnion([userId])
      });
    } catch (e) {
      print("Error adding to notInterested: $e");
    }
  }

  // Fetch user data by user ID
  Future<UserModel?> fetchUserById(String userId) async {
    try {
      final doc = await firestore.collection("users").doc(userId).get();
      if (doc.exists) {
        return UserModel.fromJson(doc.data()!);
      }
    } catch (e) {
      print("Error fetching user by ID: $e");
    }
    return null;
  }

  Future<UserModel?> getCurrentUserModel() async {
    try {
      final userDoc =
          await firestore.collection("users").doc(auth.currentUser?.uid).get();
      if (userDoc.exists) {
        return UserModel.fromJson(userDoc.data()!);
      }
    } catch (e) {
      print("Error fetching current user model: $e");
    }
    return null;
  }

  // Remove current user's ID from the interestedIn field of another user
  Future<void> removeFromInterestedIn(String likedUserId) async {
    try {
      final currentUserUid = auth.currentUser?.uid;
      await firestore.collection("users").doc(likedUserId).update({
        'interested_in': FieldValue.arrayRemove([currentUserUid])
      });
    } catch (e) {
      print("Error removing from interested_in: $e");
    }
  }

  // Remove user ID from the notInterested field
  Future<void> removeFromNotInterested(String userId) async {
    try {
      await firestore.collection("users").doc(auth.currentUser?.uid).update({
        'notInterested': FieldValue.arrayRemove([userId])
      });
    } catch (e) {
      print("Error removing from notInterested: $e");
    }
  }

  Future<void> updateUserFCMToken(String userId, String token) async {
    try {
      await _db.collection('users').doc(userId).update({
        'fcmToken': token,
      });
      print("fcmToken updated for user $userId");
    } catch (e) {
      print("Error updating fcmToken for user $userId: $e");
    }
  }

  // Block a user
  Future<void> blockUser(String userIdToBlock, String currentUserId) async {
    final userDoc = firestore.collection('users').doc(currentUserId);
    await userDoc.update({
      'blockedUserIds': FieldValue.arrayUnion([userIdToBlock]),
    }).then((_) {
      print('::: blockUser $userIdToBlock');
    });
  }

  // Unblock a user
  Future<void> unblockUser(String userIdToUnblock, String currentUserId) async {
    final userDoc = firestore.collection('users').doc(currentUserId);
    await userDoc.update({
      'blockedUserIds': FieldValue.arrayRemove([userIdToUnblock]),
    }).then((_) {
      print('::: unblockUser $userIdToUnblock');
    });
  }

  // Fetch blocked users
  Stream<List<String>> streamBlockedUsers(String currentUserId) {
    var streamBlockedUsers = firestore
        .collection('users')
        .doc(currentUserId)
        .snapshots()
        .map((snapshot) {
      final userData = snapshot.data();
      final List<String> blockedUserIds =
          List<String>.from(userData?['blockedUserIds'] ?? []);
      return blockedUserIds;
    });
    return streamBlockedUsers;
  }
}