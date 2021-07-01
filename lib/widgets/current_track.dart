import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/models/current_track_model.dart';
import 'package:provider/provider.dart';

class CurrentTrack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84.0,
      width: double.infinity,
      color: Colors.black87,
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          children: [
            if (MediaQuery.of(context).size.width > 800) _TrackInfo(),
            Spacer(),
            _PlayerControls(),
            Spacer(),
            if (MediaQuery.of(context).size.width > 1000) _MoreControls(),
          ],
        ),
      ),
    );
  }
}

class _TrackInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selected;
    if (selected == null) return SizedBox.shrink();
    return Row(
      children: [
        Image.asset(
          'assets/lofigirl.jpg',
          height: 60.0,
          width: 60.0,
          fit: BoxFit.cover,
        ),
        SizedBox(width: 12.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              selected.title,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 4.0),
            Text(
              selected.artist,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: Colors.grey[300], fontSize: 12.0),
            ),
          ],
        ),
        SizedBox(width: 12.0),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.favorite_border),
        )
      ],
    );
  }
}

class _PlayerControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selected;
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              padding: EdgeInsets.only(),
              iconSize: 20.0,
              icon: Icon(Icons.shuffle),
              onPressed: () {},
            ),
            IconButton(
              padding: EdgeInsets.only(),
              iconSize: 20.0,
              icon: Icon(Icons.skip_previous_outlined),
              onPressed: () {},
            ),
            IconButton(
              padding: EdgeInsets.only(),
              iconSize: 20.0,
              icon: Icon(
                Icons.play_circle_fill_outlined,
                size: 34.0,
              ),
              onPressed: () {},
            ),
            IconButton(
              padding: EdgeInsets.only(),
              iconSize: 20.0,
              icon: Icon(Icons.skip_next_outlined),
              onPressed: () {},
            ),
            IconButton(
              padding: EdgeInsets.only(),
              iconSize: 20.0,
              icon: Icon(Icons.repeat),
              onPressed: () {},
            ),
            SizedBox(height: 4.0),
            Row(
              children: [
                Text(
                  '0:00',
                  style: Theme.of(context).textTheme.caption,
                ),
                SizedBox(width: 8.0),
                Container(
                  height: 5.0,
                  width: MediaQuery.of(context).size.width *
                      0.3, // will be equal to 30% of screen
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(2.5),
                  ),
                ),
                SizedBox(width: 8.0),
                Text(
                  selected?.duration ?? '0:00',
                  style: Theme.of(context).textTheme.caption,
                )
              ],
            )
          ],
        )
      ],
    );
  }
}

class _MoreControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.devices_outlined),
          iconSize: 20.0,
          onPressed: () {},
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.volume_up_outlined),
              onPressed: () {},
            ),
            Container(
              height: 5.0,
              width: 70.0,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
            IconButton(
              icon: Icon(Icons.fullscreen_outlined),
              onPressed: () {},
            ),
          ],
        )
      ],
    );
  }
}
