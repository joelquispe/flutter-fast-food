import 'package:ecommercesmall/src/core/models/coupon.model.dart';
import 'package:ecommercesmall/src/core/models/method_payment.model.dart';
import 'package:ecommercesmall/src/core/models/state.model.dart';
import 'package:ecommercesmall/src/core/models/stores.model.dart';

List<StoreModel> stores = [
  StoreModel(
    idStore: "1",
    name: "TFC",
    logo: "null",
    description: "Vendemos las mejores hamburguesas del país",
    phone: "123456789",
    idCategory: 1,
    items: [],
  ),
  StoreModel(
    idStore: "2",
    name: "MCMicky",
    logo: "null",
    description: "Las mejores pizzas que puedes probar en el mundo",
    phone: "123456789",
    idCategory: 1,
    items: [],
  ),
  StoreModel(
    idStore: "3",
    name: "Chifa FUTUSEN",
    logo: "null",
    description: "El chifa que no te puede fallar",
    phone: "123456789",
    idCategory: 1,
    items: [],
  ),
  StoreModel(
    idStore: "4",
    name: "MISTERPET",
    logo: "null",
    description: "Transformamos tu mascota en una supermascota",
    phone: "123456789",
    idCategory: 3,
    items: [],
  ),
  StoreModel(
    idStore: "5",
    name: "METRA",
    logo: "null",
    description: "Siempre podrás contar con nosotros, ningún producto te faltara",
    phone: "123456789",
    idCategory: 2,
    items: [],
  ),
];

List<MethodPayment> methodPaymentsData = [
  MethodPayment(id: "1", name: "Tarjeta de credito"),
  MethodPayment(id: "2", name: "Yape"),
  MethodPayment(id: "3", name: "Efectivo"),
];
List<Coupon> couponsData = [
  Coupon(id: "1", code: "YOECODEIBK",isActive: true, value: 20),
  Coupon(id: "2", code: "GIANBTP",isActive: false, value: 30),
  Coupon(id: "3", code: "SOTOINT",isActive: true, value: 100),
];

List<State> statesData = [
  State(id: 1, name: "Realizado",position: 1),
  State(id: 2, name: "Confirmado",position: 2),
  State(id: 3, name: "Preparando", position: 3),
  State(id: 4, name: "En camino", position: 4),
  State(id: 5, name: "Entregado",position: 5),
];