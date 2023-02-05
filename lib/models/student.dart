import 'package:flutter/material.dart';

@immutable
class Student {
  const Student({required this.name, required this.id, required this.department});

  final String name;
  final String id;
  final Department department;

  factory Student.fromMap(Map<String, dynamic> data){
    return Student(
      name: data['name'],
      id: data['rollNo'],
      department: data['department'],
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'name': name,
      'rollNo': id,
      'department': department,
    };
  }

}

enum Department {
  ba_english,
  ba_sociology,
  ba_economics,
  ba_political_science,
  ba_defence,
  bca,
  bba,
  bsc_maths,
  bsc_physics,
  bsc_chemistry,
  bsc_biology,
  bsc_zoology,
  bsc_visual_communication,
  bsc_bioTechnology,
  bsc_it,
  bsc_data_analytics,
  bsc_cs,
  bcom_general,
  bcom_corporate,
  bcom_information_system,
  bcom_computer_application,
  bcom_professional_accounting,
  bcom_accounting_and_finance,
  bcom_honours,
  bcom_bank_management,
  bcom_marketing_management,
  ma_economics,
  ma_defence,
  msc_chemistry,
  msc_maths,
  msc_zoology,
  mcom_general,
  msw,
}
