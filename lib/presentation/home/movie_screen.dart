import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movie/up_coming/movie_upcoming_cubit.dart';
import 'package:movie_app/bloc/movie/up_coming/movie_upcoming_state.dart';
import 'package:movie_app/core/network/model/movies.dart';
import 'package:movie_app/presentation/setting/setting_screen.dart';
import 'package:movie_app/utils/app_constant.dart';
import 'package:movie_app/utils/navigation.dart';
import 'package:movie_app/utils/sizes.dart';
import 'package:movie_app/utils/utils.dart';
import 'package:movie_app/utils/widget/card/card_home.dart';
import 'package:movie_app/utils/widget/shimmer/shimmer_card.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(AppConstant.movie,
          style: TextStyle(
              fontSize: Sizes.dp18(context),
              fontWeight: FontWeight.w600
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () => _doNavigateToSettings(),
          )
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Container(
        margin: EdgeInsets.all(Sizes.dp10(context)),
        child: Column(
          children: <Widget>[
            _buildBanner(context),
            SizedBox(
              height: Sizes.dp12(context),
            ),
            _buildUpComing(context),
            SizedBox(
              height: Sizes.dp12(context),
            ),
            _buildPopular(context),
            SizedBox(
              height: Sizes.dp12(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBanner(BuildContext context) {
    return Container();
  }

  Widget _buildUpComing(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Row(
            children: <Widget>[
              Text('Up Coming',
                style: TextStyle(
                  fontSize: Sizes.dp14(context),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: Sizes.dp16(context),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
        SizedBox(
          width: Sizes.width(context),
          height: Sizes.width(context) / 1.8,
          child: BlocBuilder<MovieUpcomingCubit, MovieUpcomingState>(
            builder: (context, state) {
              final status = state.state.status;
              if (status.isLoading) {
                return ShimmerCard();
              } else if (status.isEmpty) {
                return Text(state.state.message);
              } else if (status.isError) {
                return Text(state.state.message);
              } else if (status.isLoaded) {
                final result = state.state.data!.results;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: result.length > 5 ? 5 : result.length,
                  itemBuilder: (BuildContext context, int index) {
                    Movies movies = result[index];
                    return CardHome(
                      image: movies.posterPath,
                      title: movies.title,
                      rating: movies.voteAverage,
                      onTap: () { },
                    );
                  },
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        )
      ],
    );
  }

  Widget _buildPopular(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Row(
            children: <Widget>[
              Text('Popular',
                style: TextStyle(
                  fontSize: Sizes.dp14(context),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: Sizes.dp16(context),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
        SizedBox(
          width: Sizes.width(context),
          height: Sizes.width(context) / 1.8,
          child: BlocBuilder<MovieUpcomingCubit, MovieUpcomingState>(
            builder: (context, state) {
              final status = state.state.status;
              if (status.isLoading) {
                return ShimmerCard();
              } else if (status.isEmpty) {
                return Text(state.state.message);
              } else if (status.isError) {
                return Text(state.state.message);
              } else if (status.isLoaded) {
                final result = state.state.data!.results;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: result.length > 5 ? 5 : result.length,
                  itemBuilder: (BuildContext context, int index) {
                    Movies movies = result[index];
                    return CardHome(
                      image: movies.posterPath,
                      title: movies.title,
                      rating: movies.voteAverage,
                      onTap: () { },
                    );
                  },
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _getMovieUpComing();
  }

  void _doNavigateToSettings() {
    Navigation.intent(context, SettingScreen.routeName);
  }

  void _getMovieUpComing() {
    context.read<MovieUpcomingCubit>().getMovieUpcoming();
  }

}