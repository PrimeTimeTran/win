import React, { Component } from 'react';
import { ListView } from 'react-native';
import { connect } from 'react-redux';
import ListItem from './ListItem';

class LibraryList extends Component {
  // Tells ListView what data it will be using
  // Pass in List of Libraries
  componentWillMount() {
    // Initialize a datasource
    const ds = new ListView.DataSource({
      rowHasChanged: (r1, r2) => r1 !== r2
    });
    this.dataSource = ds.cloneWithRows(this.props.libraries);
  }

  renderRow(library) {
    return <ListItem library={library}/>;
  }

  render() {
    return (
      <ListView
        // Pass the dataSource to the ListView component
        dataSource={this.dataSource}
        renderRow={this.renderRow}
      />
    );
  }
}

// Takes the global state object(inside of the redux store),
// takes some properties off this object and provides them as props to component LibraryList
const mapStatetoProps = state => {

  // If I return an object from this function, it
  // will show up as props to the LibraryList.

  // It will have a prop of libraries, and a value of
  // an arry of libraries.
  return { libraries: state.libraries };
};

// 2 Step process
// Calls function connect, when connect returns it
// then the function gets called with LibraryList
export default connect(mapStatetoProps)(LibraryList);
