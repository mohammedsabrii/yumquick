import 'package:flutter/widgets.dart';
import 'package:yumquick/feactures/home/entity/prodacts_entity.dart';

class GridViewItemBackGroundImage extends StatelessWidget {
  const GridViewItemBackGroundImage({super.key, required this.productsEntity});
  final ProductsEntity productsEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.175,
      width: MediaQuery.sizeOf(context).width * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(productsEntity.image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
