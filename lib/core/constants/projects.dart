import '../../models/project.dart';

import 'assets_constants.dart';

List<Project> projects = [
  Project(
    projectNo: '01',
    links: [
      'https://play.google.com/store/apps/details?id=com.aditya.kavya_kunj&hl=en_IN'
    ],
    title: 'KavyaKunj',
    category: 'A Shayari App',
    imageUrl: kavyaKunjImagePath,
    description: 'Description',
  ),
  Project(
    projectNo: '02',
    links: ['https://github.com/Adityashahi4465/ASCentralDesk'],
    title: 'ASCentralDesk',
    category: 'University Management System',
    imageUrl: asCentralDeskImagePath,
    description: 'Description',
  ),
  Project(
    projectNo: '03',
    links: ['https://github.com/Adityashahi4465/ASCentralDesk'],
    title: 'ASShop',
    category: 'University Management System',
    imageUrl: asCentralDeskImagePath,
    description: 'Description',
  ),
  Project(
    projectNo: '04',
    links: ['https://github.com/Adityashahi4465/ASCentralDesk'],
    title: 'Portfolio',
    category: 'University Management System',
    imageUrl: asCentralDeskImagePath,
    description: 'Description',
  ),
];
