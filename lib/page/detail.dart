import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wiki_howto_zh/bloc/base_bloc.dart';
import 'package:wiki_howto_zh/bloc/wiki_detail.dart';
import 'package:wiki_howto_zh/widget/error.dart';
import 'package:wiki_howto_zh/widget/wiki_detail.dart';

class Detail extends StatefulWidget {
  final int id;

  Detail(this.id);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  WiKiDetailBloc detailBloc;

  @override
  void initState() {
    super.initState();
    detailBloc = new WiKiDetailBloc();
    detailBloc.add(DetailEvent.init(widget.id));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    detailBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          return detailBloc.add(DetailEvent.init(widget.id));
        },
        child: BlocBuilder<WiKiDetailBloc, BaseState>(
          bloc: detailBloc,
          builder: (BuildContext context, state) {
            switch (state.runtimeType) {
              case LoadingState:
                return Center(child: CircularProgressIndicator());
              case SuccessState:
                SuccessState successState = state;
                return WikiDetail(successState.response);
              default:
                ErrorState errorState = state;
                return MyErrorWidget(errorState.msg);
            }
          },
        ),
      ),
    );
  }
}
