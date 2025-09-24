import 'package:flutter_bloc/flutter_bloc.dart';

import '../../businesslogic/blocs/transaction/transaction_bloc.dart';
import '../widgets/responsive.dart';
import 'package:flutter/material.dart';


class ActorScrollerMaterial extends StatefulWidget {
  @override
  ActorScrollerMaterialState createState() => ActorScrollerMaterialState();
}

class ActorScrollerMaterialState extends State<ActorScrollerMaterial> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _ActorScrollerMaterialMobile(),
          tablet: _ActorScrollerMaterialTablet(),
        ),
      ),
    );
  }
}

class _ActorScrollerMaterialTablet extends StatelessWidget {
  const _ActorScrollerMaterialTablet();
  Widget _buildActor(BuildContext ctx, int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(2.0), //or 15.0
            child: Container(
              height: 80.0,
              width: 90.0,
              child: Card(
                child: InkWell(
                  onTap: () {
                    // Navigator.of(context,rootNavigator: true)
                    //     .push(MaterialPageRoute(builder: (context) {
                    //   return Download();
                    // }));
                  },
                  child: FadeInImage.assetNetwork(
                    alignment: Alignment.topCenter, // add this
                    placeholder: 'dummy image',
                    image: 'https://via.placeholder.com/500x300.png',
                    fit: BoxFit.fitWidth,
                    height: 300,
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            //  actor.name
            child: Text('lorem'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Recommended',
            // style: textTheme.subhead.copyWith(fontSize: 18.0),
          ),
        ),
        SizedBox.fromSize(
          size: const Size.fromHeight(120.0),
          child: ListView.builder(
      
            // itemCount:   state.recommendednft.length
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(top: 8.0, left: 20.0),
            itemBuilder: _buildActor,
          ),
        ),
      ],
    );
  }
}

class _ActorScrollerMaterialMobile extends StatelessWidget {
  Widget _buildActor(BuildContext ctx, int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child:
      //  BlocConsumer<TransactionBloc, TransactionState>(
      //   listener: (context, state) {
      //     // TODO: implement listener
      //   },
      //   builder: (context, state) {
         
      //     return
           Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(2.0), //or 15.0
                child: Container(
                  height: 80.0,
                  width: 90.0,
                  child: Card(
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Download();
                        // }));
                      },
                      child: FadeInImage.assetNetwork(
                        alignment: Alignment.topCenter, // add this
                        placeholder: 'dummy image',
                        image: 'https://via.placeholder.com/500x300.png',
                        fit: BoxFit.fitWidth,
                        height: 300,
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                //  actor.name
                child: Text('lorem'),
              ),
            ],
          )
       
        // },
      // ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    final textScale = MediaQuery.of(context).textScaleFactor;

    return 
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Recommended',
            // style: textTheme.subhead.copyWith(fontSize: 18.0),
          ),
        ),
        SizedBox.fromSize(
          size: const Size.fromHeight(120.0),
          child: ListView.builder(
        
       //     itemCount:   state.recommendednft.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(top: 8.0, left: 20.0),
            itemBuilder: _buildActor,
          ),
        ),
      ],
    );
  }
}





class ActorScrollerCupertino extends StatefulWidget {
  @override
  ActorScrollerCupertinoState createState() => ActorScrollerCupertinoState();
}

class ActorScrollerCupertinoState extends State<ActorScrollerCupertino> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _ActorScrollerCupertinoMobile(),
          tablet: _ActorScrollerCupertinoTablet(),
        ),
      ),
    );
  }
}

class _ActorScrollerCupertinoTablet extends StatelessWidget {
  const _ActorScrollerCupertinoTablet();
  Widget _buildActor(BuildContext ctx, int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(2.0), //or 15.0
            child: Container(
              height: 80.0,
              width: 90.0,
              child: Card(
                child: InkWell(
                  onTap: () {
                    // Navigator.of(context,rootNavigator: true)
                    //     .push(MaterialPageRoute(builder: (context) {
                    //   return Download();
                    // }));
                  },
                  child: FadeInImage.assetNetwork(
                    alignment: Alignment.topCenter, // add this
                    placeholder: 'dummy image',
                    image: 'https://via.placeholder.com/500x300.png',
                    fit: BoxFit.fitWidth,
                    height: 300,
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            //  actor.name
            child: Text('lorem'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Recommended',
            // style: textTheme.subhead.copyWith(fontSize: 18.0),
          ),
        ),
        SizedBox.fromSize(
          size: const Size.fromHeight(120.0),
          child: ListView.builder(
      
            // itemCount:   state.recommendednft.length
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(top: 8.0, left: 20.0),
            itemBuilder: _buildActor,
          ),
        ),
      ],
    );
  }
}

class _ActorScrollerCupertinoMobile extends StatelessWidget {
  Widget _buildActor(BuildContext ctx, int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child:
      //  BlocConsumer<TransactionBloc, TransactionState>(
      //   listener: (context, state) {
      //     // TODO: implement listener
      //   },
      //   builder: (context, state) {
         
      //     return
           Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(2.0), //or 15.0
                child: Container(
                  height: 80.0,
                  width: 90.0,
                  child: Card(
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context,rootNavigator: true)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return Download();
                        // }));
                      },
                      child: FadeInImage.assetNetwork(
                        alignment: Alignment.topCenter, // add this
                        placeholder: 'dummy image',
                        image: 'https://via.placeholder.com/500x300.png',
                        fit: BoxFit.fitWidth,
                        height: 300,
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                //  actor.name
                child: Text('lorem'),
              ),
            ],
          )
       
        // },
      // ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    final textScale = MediaQuery.of(context).textScaleFactor;

    return 
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Recommended',
            // style: textTheme.subhead.copyWith(fontSize: 18.0),
          ),
        ),
        SizedBox.fromSize(
          size: const Size.fromHeight(120.0),
          child: ListView.builder(
        
       //     itemCount:   state.recommendednft.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(top: 8.0, left: 20.0),
            itemBuilder: _buildActor,
          ),
        ),
      ],
    );
  }
}



