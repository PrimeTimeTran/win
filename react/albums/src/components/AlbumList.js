import React, { Component } from 'react';
import { ScrollView } from 'react-native';
import AlbumDetail from './AlbumDetail';


class AlbumList extends Component {
  // Initializing state
  state = { albums: [] };
  componentWillMount() {
    fetch('https://rallycoding.herokuapp.com/api/music_albums')
    .then((response) => response.json())

    // We only ever update the object with this.setState.
    // Never state = ...
    .then((responseData) => this.setState({ albums: responseData }));
  }

  renderAlbums() {
    return this.state.albums.map(album =>
      <AlbumDetail key={album.title} album={album} /> // Property Album is being passed to the
      // child component AlbumDetail
    );
  }

  render() {
    return (
        <ScrollView>
          {this.renderAlbums()}
        </ScrollView>
    );
  }
}
export default AlbumList;
