

import 'package:flutter_getx_architecture/app/data/model/user_data_response.dart';
import 'package:flutter_getx_architecture/app/data/repository/users_data_repository.dart';

class MockUsersDataRepository implements IUsersDataRepository {

  @override
  Future<List<UserDataResponse>?> getUsers() async {
    return [
      UserDataResponse(
        id: 1,
        name: 'Hemant',
        email: 'imhsharma1@gmail.com',
        phone: '123456789',
        username: 'imhemant',
        website: 'https://www.xyz.com'
      ),
      UserDataResponse(
          id: 2,
          name: 'Vedant',
          email: 'imvedant@gmail.com',
          phone: '2123456789',
          username: 'imvedant',
          website: 'https://www.xyz2.com'
      ),
      UserDataResponse(
          id: 3,
          name: 'Lokesh',
          email: 'imlokesh@gmail.com',
          phone: '3123456789',
          username: 'imlokesh',
          website: 'https://www.xyz3.com'
      ),
      UserDataResponse(
          id: 4,
          name: 'Dheeraj',
          email: 'imdheeraj@gmail.com',
          phone: '4123456789',
          username: 'imdheeraj',
          website: 'https://www.xyz4.com'
      ),
      UserDataResponse(
          id: 5,
          name: 'Nikhilesh',
          email: 'imnikhilesh@gmail.com',
          phone: '5123456789',
          username: 'imnikhilesh',
          website: 'https://www.xyz5.com'
      ),
      UserDataResponse(
          id: 6,
          name: 'Aaditya',
          email: 'imaaditya@gmail.com',
          phone: '6123456789',
          username: 'imaaditya',
          website: 'https://www.xyz6.com'
      ),
    ];
  }
}