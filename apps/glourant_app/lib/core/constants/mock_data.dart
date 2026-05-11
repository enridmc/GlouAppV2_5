import '../../shared/models/demo_user.dart';
import '../../shared/models/kitchen_order.dart';
import '../../shared/models/menu_item.dart';
import '../../shared/models/restaurant_table.dart';

const demoUsers = [
  DemoUser(
    name: 'Admin Glourant',
    email: 'admin@glourant.demo',
    pin: '0000',
    role: UserRole.admin,
  ),
  DemoUser(
    name: 'Jefa de sala',
    email: 'sala@glourant.demo',
    pin: '1111',
    role: UserRole.sala,
  ),
  DemoUser(
    name: 'Cocina',
    email: 'cocina@glourant.demo',
    pin: '2222',
    role: UserRole.cocina,
  ),
  DemoUser(
    name: 'Cliente mesa 2',
    email: 'cliente@glourant.demo',
    pin: '3333',
    role: UserRole.cliente,
  ),
];

const tables = [
  RestaurantTable(
    name: 'Mesa 1',
    room: 'Terraza',
    seats: 2,
    status: TableStatus.free,
  ),
  RestaurantTable(
    name: 'Mesa 2',
    room: 'Terraza',
    seats: 4,
    status: TableStatus.occupied,
    session: 'QR-2A91',
    total: 38.50,
  ),
  RestaurantTable(
    name: 'Mesa 3',
    room: 'Salon',
    seats: 4,
    status: TableStatus.reserved,
  ),
  RestaurantTable(
    name: 'Mesa 4',
    room: 'Salon',
    seats: 6,
    status: TableStatus.occupied,
    session: 'QR-77C4',
    total: 64.80,
  ),
  RestaurantTable(
    name: 'Mesa 5',
    room: 'Salon',
    seats: 2,
    status: TableStatus.blocked,
  ),
  RestaurantTable(
    name: 'Mesa 6',
    room: 'Barra',
    seats: 3,
    status: TableStatus.free,
  ),
];

const menu = [
  MenuItem(
    name: 'Croquetas de jamon',
    category: 'Entrantes',
    description: 'Racion cremosa con alioli suave',
    price: 9.80,
    available: true,
  ),
  MenuItem(
    name: 'Ensalada de burrata',
    category: 'Entrantes',
    description: 'Tomate, pesto y aceite de albahaca',
    price: 12.40,
    available: true,
  ),
  MenuItem(
    name: 'Arroz meloso',
    category: 'Principales',
    description: 'Setas, fondo tostado y parmesano',
    price: 17.90,
    available: true,
  ),
  MenuItem(
    name: 'Taco de atun',
    category: 'Principales',
    description: 'Plancha, soja citrica y verduras',
    price: 19.50,
    available: false,
  ),
  MenuItem(
    name: 'Tarta de queso',
    category: 'Postres',
    description: 'Horneada, con frutos rojos',
    price: 6.90,
    available: true,
  ),
];

const kitchenOrders = [
  KitchenOrder(
    code: '#1024',
    table: 'Mesa 2',
    items: ['2 Croquetas', '1 Arroz meloso'],
    status: OrderStatus.kitchen,
    minutes: 7,
  ),
  KitchenOrder(
    code: '#1025',
    table: 'Mesa 4',
    items: ['1 Ensalada', '2 Tartas de queso'],
    status: OrderStatus.pending,
    minutes: 2,
  ),
  KitchenOrder(
    code: '#1021',
    table: 'Mesa 4',
    items: ['2 Bebidas', '1 Croquetas'],
    status: OrderStatus.ready,
    minutes: 14,
  ),
];
