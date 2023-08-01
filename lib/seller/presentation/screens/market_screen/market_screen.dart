import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_pick_seller/seller/presentation/screens/new_post_screen/new_post.dart';
import 'package:fresh_pick_seller/seller/presentation/screens/post_details_screen/post_details.dart';
import 'package:fresh_pick_seller/seller/presentation/widgets/loading_tile/screen_loading_tile.dart';
import '../../../business_logic/market_page/bloc/marketplace_page_bloc.dart';
import '../../widgets/post_tile/post_tile_widget_test.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  late MarketplacePageBloc marketplacePageBloc;
  @override
  void initState() {
    marketplacePageBloc = BlocProvider.of<MarketplacePageBloc>(context);
    marketplacePageBloc.add(InitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MarketplacePageBloc, MarketplacePageState>(
      bloc: marketplacePageBloc,
      listenWhen: (previous, current) => current is MarketplacePageActionState,
      buildWhen: (previous, current) => current is! MarketplacePageActionState,
      listener: (context, state) {
        if (state is MarketplaceNavigateToNewPostPageActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const NewPost()));
        } else if (state is MarketplaceNavigateToPostDetailPageActionState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PostDetailsPage(
                        post: state.selectedPost,
                      )));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case MarketplaceLoadingState:
            return const ScreenLoadingWidget();
          case MarketplaceLoadingSucessState:
            final sucessState = state as MarketplaceLoadingSucessState;

            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      width: double.maxFinite,
                      padding: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          width: 2,
                          color: const Color.fromRGBO(105, 240, 174, 1),
                        ),
                        boxShadow: const [
                          BoxShadow(
                            spreadRadius: 0,
                            offset: Offset(0, 0.75),
                            blurRadius: 8,
                            color: Colors.black54,
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'New Post',
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          IconButton(
                            onPressed: () {
                              marketplacePageBloc
                                  .add(NewPostButtonClickedEvent());
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Color.fromRGBO(105, 240, 174, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Your Posts',
                          style: TextStyle(
                            color: Color.fromRGBO(151, 151, 151, 1),
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Icon(
                          Icons.list,
                          color: Color.fromRGBO(151, 151, 151, 1),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(160, 42),
                            backgroundColor:
                                const Color.fromRGBO(105, 240, 174, 1),
                            elevation: 0,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Active (${sucessState.posts.length})',
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(160, 42),
                            backgroundColor:
                                const Color.fromRGBO(105, 240, 174, 1),
                            elevation: 0,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Finished (12)',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: sucessState.posts.length,
                        itemBuilder: (context, index) {
                          return PostTileWidgetTest(
                            post: sucessState.posts[index],
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
