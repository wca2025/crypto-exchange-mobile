import 'package:flutter_bloc/flutter_bloc.dart';

import '../../businesslogic/blocs/transaction/transaction_bloc.dart';
import 'collection.dart';
import 'package:flutter/material.dart';

class PhotoScroller extends StatelessWidget {
  // PhotoScroller(this.photoUrls);
  // final List<Photo> photoUrls;

  Widget _buildPhoto(BuildContext context, int index) {
    // var photo = photoUrls[index];
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Padding(
        padding: EdgeInsets.only(left: 4, right: 4),
        child: Container(
          // padding: const EdgeInsets.all(1),

          // child: Text('lorem'),
          child: InkWell(
              onTap: () {},
              child: Column(
                children: [
                  Container(
                    color: theme.scaffoldBackgroundColor,
                    height: screenHeight * 0.160,
                    width: screenWidth * 0.400,
                    child: FadeInImage.assetNetwork(
                        alignment: Alignment.topCenter, // add this
                        placeholder: 'dummy image',
                        image:
                            'https://public.nftstatic.com/static/nft/res/nft-cex/S3/1661516584575_vxd2uplhuyt0qrq74qlzv25k0wus7pkl_400x400.png',
                        fit: BoxFit.fitWidth,
                        height: screenHeight * 0.135,
                        width: screenWidth * 0.400),
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(
                            top: 1.0, bottom: 1.0, left: 0.0, right: 3.0),
                        child: Text(
                          "Mr Ape MAN",
                          style: TextStyle(
                            // color: primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 1.0, bottom: 1.0, left: 80.0, right: 3.0),
                        child: Text(
                          "",
                          style: TextStyle(
                            // color: primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: 1.0, bottom: 1.0, left: 1.0, right: 70.0),
                        child: Text("Price",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14 * textScale,
                                color: Colors.black38)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 1.0, bottom: 1.0, left: 60.0, right: 3.0),
                        child: Text(
                          "2",
                          style: TextStyle(
                            // color: primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: 1.0, bottom: 1.0, left: 1.0, right: 60.0),
                        child: Text("Quantity",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12 * textScale,
                                color: Colors.black38)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 1.0, bottom: 1.0, left: 55.0, right: 3.0),
                        child: Text(
                          "2",
                          style: TextStyle(
                            // color: primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),

          //color: Colors.grey,
        ));
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox.fromSize(
          size: const Size.fromHeight(165.0),
          child: 
          // BlocConsumer<TransactionBloc, TransactionState>(
          //   listener: (context, state) {
          //     // TODO: implement listener
          //   },
          //   builder: (context, state) {
          //     return
               ListView.builder(
                // state.nft.length,
                itemCount: 8,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(top: 0.0, left: 10.0),
                itemBuilder: _buildPhoto,
              )
              // ;
          //   },
          // ),
        ),
      ],
    );
  }
}
