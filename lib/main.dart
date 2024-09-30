import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:quran_player/src/cloud_api/cloud_remote_api.dart';
import 'package:quran_player/src/features/home/home_screen.dart';
import 'package:quran_player/src/player_repository/player_repository.dart';
import 'package:quran_player/src/playlist_repository/playlist_repository.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final _cloudApi = CloudRemoteApi();
  late final _playlistRepository = PlaylistRepository(cloudApi: _cloudApi);
  late final _playerRepository = PlayerRepository();

  @override
  void initState() {
    super.initState();
    _playlistRepository.getResources();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: _playlistRepository,
        ),
        RepositoryProvider.value(
          value: _playerRepository,
        ),
      ],
      child: MaterialApp(
        title: 'Quran Player',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
