import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_styles.dart';
import 'package:yumquick/core/utils/colors.dart';
import 'package:yumquick/core/widget/custom_show_snackbar.dart';
import 'package:yumquick/feactures/home/entity/prodacts_entity.dart';
import 'package:yumquick/feactures/home/presentation/view/manger/cubit/cart_cubit/cart_cubit.dart';

class ProdactDetailsButton extends StatelessWidget {
  const ProdactDetailsButton({super.key, required this.productsEntity});
  final ProductsEntity productsEntity;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartsCubit, CartsState>(
      listener: (context, state) {
        if (state is CartsSuccess) {
          customShowSnackBar(context, title: 'Product added to your cart');
        } else if (state is CartsFailure) {
          customShowSnackBar(context, title: state.errorMessage);
        }
      },
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.only(left: 10),
          width: 180.32,
          height: 33,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(44.79),
            color: AppColor.kMainColor,
          ),

          child: GestureDetector(
            onTap: () {
              BlocProvider.of<CartsCubit>(context).addToCart(productsEntity);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppAssets.kAddProdactToCart),
                const SizedBox(width: 7),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    'Add to Cart',

                    style: AppStyles.styleLeagueSpartanMediem20(
                      context,
                    ).copyWith(color: AppColor.kCultured),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
