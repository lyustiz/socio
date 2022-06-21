import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socio/utils/db/db_manager.dart';
import 'package:socio/utils/route_helper.dart';

class DbInit extends StatelessWidget {
  const DbInit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () => navigateTo(context, 'juego_list'),
                    icon: Icon(Icons.chevron_left)),
                ElevatedButton(
                  onPressed: () => print(1),
                  child: Text('Select'),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green)),
                  onPressed: () => insertData(context),
                  child: Text('Insert'),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.orange)),
                  onPressed: () => updateData(context),
                  child: Text('Update'),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  onPressed: () => deleteData(context),
                  child: Text('Delete'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue)),
                  onPressed: () => insertPremios(context),
                  child: Text('figura'),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue)),
                  onPressed: () => insertCartones(context),
                  child: Text('carton'),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue)),
                  onPressed: () => insertClientes(context),
                  child: Text('cliente'),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue)),
                  onPressed: () => insertSolicitud(context),
                  child: Text('solic'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void insertData(BuildContext context) async {
  // context.read<SerieBloc>().add(InsertSerie(serie));
}

void updateData(BuildContext context) async {
  /*  final serie = Serie(idSerie: 1, nombre: 'luis Maria', simbolo: 'D');

  context.read<SerieBloc>().add(UpdateSerie(serie)); */
}

void deleteData(BuildContext context) async {
/*   final serie = Serie(idSerie: 2, nombre: 'luis daniel', simbolo: 'D');

  context.read<SerieBloc>().add(DeleteSerie(serie)); */
}

insertSolicitud(context) async {}

insertPremios(context) async {
  AppDatabase db = AppDatabase();
  var count = await db
      .customSelect(
          ''' SELECT COUNT(id_juego_premio) nro FROM juegos_premios ''')
      .getSingle()
      .then((value) => value.data['nro']);

  if (count < 1) {
    db.customInsert(
        '''INSERT INTO juegos_premios VALUES ( NULL, 85, 1, 20000, 'A', 1640181481)''');
    db.customInsert(
        '''INSERT INTO juegos_premios VALUES ( NULL, 85, 1, 20000, 'A', 1640181481)''');
    db.customInsert(
        '''INSERT INTO juegos_premios VALUES ( NULL, 85, 1, 20000, 'A', 1640181481)''');
    db.customInsert(
        '''INSERT INTO juegos_premios VALUES ( NULL, 86, 1, 20000, 'A', 1640181481)''');
    db.customInsert(
        '''INSERT INTO juegos_premios VALUES ( NULL, 86, 1, 20000, 'A', 1640181481)''');
    db.customInsert(
        '''INSERT INTO juegos_premios VALUES ( NULL, 86, 1, 20000, 'A', 1640181481)''');
    db.customInsert(
        '''INSERT INTO juegos_premios VALUES ( NULL, 87, 1, 20000, 'A', 1640181481)''');
    db.customInsert(
        '''INSERT INTO juegos_premios VALUES ( NULL, 87, 1, 20000, 'A', 1640181481)''');
    db.customInsert(
        '''INSERT INTO juegos_premios VALUES ( NULL, 87, 1, 20000, 'A', 1640181481)''');
    db.customInsert(
        '''INSERT INTO juegos_premios VALUES ( NULL, 88, 1, 20000, 'A', 1640181481)''');
    db.customInsert(
        '''INSERT INTO juegos_premios VALUES ( NULL, 88, 1, 20000, 'A', 1640181481)''');
    db.customInsert(
        '''INSERT INTO juegos_premios VALUES ( NULL, 88, 1, 20000, 'A', 1640181481)''');
  }
}

insertCartones(context) async {}

insertClientes(context) async {}

insertPromocion(context) async {}
