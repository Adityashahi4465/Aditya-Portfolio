import 'package:flutter/material.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Our Services',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16),
          ServiceItem(
              title: 'Service 1', description: 'Description for Service 1'),
          ServiceItem(
              title: 'Service 2', description: 'Description for Service 2'),
          ServiceItem(
              title: 'Service 3', description: 'Description for Service 3'),
          ServiceItem(
              title: 'Service 1', description: 'Description for Service 1'),
          ServiceItem(
              title: 'Service 2', description: 'Description for Service 2'),
          ServiceItem(
              title: 'Service 3', description: 'Description for Service 3'),
          ServiceItem(
              title: 'Service 1', description: 'Description for Service 1'),
          ServiceItem(
              title: 'Service 2', description: 'Description for Service 2'),
          ServiceItem(
              title: 'Service 3', description: 'Description for Service 3'),
          ServiceItem(
              title: 'Service 1', description: 'Description for Service 1'),
          ServiceItem(
              title: 'Service 2', description: 'Description for Service 2'),
          ServiceItem(
              title: 'Service 3', description: 'Description for Service 3'),
          // Add more ServiceItems as needed
        ],
      ),
    );
  }
}

class ServiceItem extends StatelessWidget {
  final String title;
  final String description;

  const ServiceItem({Key? key, required this.title, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
