import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/product.dart';
import 'package:shop/utils/app_routes.dart';

class ProductGridItem extends StatelessWidget {
  const ProductGridItem({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(AppRoutes.productDetail, arguments: product);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: GridTile(
          footer: GridTileBar(
            title: Text(
              product.name,
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.black54,
            leading: Consumer<Product>(
              builder: (context, product, _) => IconButton(
                onPressed: () {
                  product.toggleFavorite();
                },
                icon: Icon(product.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border),
                color: Theme.of(context).secondaryHeaderColor,
              ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.shopping_cart),
              color: Theme.of(context).secondaryHeaderColor,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text("Produto Adicionado com Sucesso!"),
                    duration: const Duration(seconds: 3),
                    action: SnackBarAction(
                        label: "Desfazer",
                        onPressed: () {
                          cart.removeSingleItem(product.id);
                        }),
                  ),
                );
                cart.additem(product);
              },
            ),
          ),
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
