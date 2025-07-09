import 'package:flutter/material.dart';
import 'package:yumquick/feactures/Menu/presentation/view/widget/dessert_details.dart';
import 'package:yumquick/feactures/Menu/presentation/view/widget/drinks_details.dart';
import 'package:yumquick/feactures/Menu/presentation/view/widget/meal_details.dart';
import 'package:yumquick/feactures/Menu/presentation/view/widget/snacks_details.dart';
import 'package:yumquick/feactures/Menu/presentation/view/widget/vegan_details.dart';

final List<Widget> menuList = [
  const SnacksDetails(),
  const MealDetails(),
  const VeganDetails(),
  const DessertDetails(),
  const DrinksDetails(),
];
