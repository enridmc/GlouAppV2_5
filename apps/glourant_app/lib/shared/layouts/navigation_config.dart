import 'package:flutter/material.dart';

import '../models/demo_user.dart';

List<int> sectionsForRole(UserRole role) {
  switch (role) {
    case UserRole.admin:
      return [0, 1, 2, 3];
    case UserRole.sala:
      return [0, 1, 2];
    case UserRole.cocina:
      return [3];
    case UserRole.cliente:
      return [2];
  }
}

int initialSectionForRole(UserRole role) {
  switch (role) {
    case UserRole.admin:
    case UserRole.sala:
      return 0;
    case UserRole.cocina:
      return 3;
    case UserRole.cliente:
      return 2;
  }
}

String roleLabel(UserRole role) {
  switch (role) {
    case UserRole.admin:
      return 'Administrador';
    case UserRole.sala:
      return 'Sala';
    case UserRole.cocina:
      return 'Cocina';
    case UserRole.cliente:
      return 'Cliente QR';
  }
}

IconData roleIcon(UserRole role) {
  switch (role) {
    case UserRole.admin:
      return Icons.admin_panel_settings;
    case UserRole.sala:
      return Icons.table_bar;
    case UserRole.cocina:
      return Icons.soup_kitchen;
    case UserRole.cliente:
      return Icons.qr_code_scanner;
  }
}

String sectionLabel(int section) {
  switch (section) {
    case 1:
      return 'Mesas';
    case 2:
      return 'Carta';
    case 3:
      return 'Cocina';
    default:
      return 'Panel';
  }
}

String sectionTitle(int section) {
  switch (section) {
    case 1:
      return 'Mesas y sesiones';
    case 2:
      return 'Carta y pedido QR';
    case 3:
      return 'Cocina';
    default:
      return 'Panel Glourant';
  }
}

IconData sectionIcon(int section) {
  switch (section) {
    case 1:
      return Icons.table_restaurant_outlined;
    case 2:
      return Icons.restaurant_menu_outlined;
    case 3:
      return Icons.soup_kitchen_outlined;
    default:
      return Icons.space_dashboard_outlined;
  }
}

IconData sectionSelectedIcon(int section) {
  switch (section) {
    case 1:
      return Icons.table_restaurant;
    case 2:
      return Icons.restaurant_menu;
    case 3:
      return Icons.soup_kitchen;
    default:
      return Icons.space_dashboard;
  }
}
