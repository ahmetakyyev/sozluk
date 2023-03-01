//@dart=2.9
import 'package:injector/injector.dart';
import 'package:sozluk/utils/constantes.dart';
import 'package:supabase/supabase.dart';

import '../utils/supabase_manager.dart';

class BookMarkService {
  SupabaseManager manager = SupabaseManager();
  RealtimeSubscription wordSubscription;

  Future addBookMark(
      String word, meanaing, audioURL, phoenetics, partsOfSpeech) async {
    await manager.client.from('bookmarks').insert(
      {
        'createdBy': supabase.auth.currentUser.email,
        'word': word,
        'meanaing': meanaing,
        'audioURL': audioURL,
        'phoenetics': phoenetics,
        'partsOfSpeech': partsOfSpeech,
      },
    ).execute();
  }

  getUserBookmark() async {
    final response = await manager.client
        .from('bookmarks')
        .select()
        .eq('createdBy', supabase.auth.currentUser.email)
        .order('createdAt', ascending: true)
        .execute();

    // print(response.data);
    final readData = response.data as List;

    return readData;
  }

  void setupWordSubsricption() {
    wordSubscription = Injector.appInstance
        .get<SupabaseClient>()
        .from('bookmarks')
        .on(SupabaseEventTypes.delete, (payload) {
      handleDelete(payload);
    }).subscribe();
  }

  void handleDelete(payload) {
    final deleteId = payload.oldRecord['id'];
    deleteBookMark(deleteId);
  }

  deleteBookMark(String id) async {
    await manager.client.from('bookmarks').delete().eq('id', id).execute();
  }
}
