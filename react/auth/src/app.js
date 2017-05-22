import React, { Component } from 'react';
import { View } from 'react-native';
import firebase from 'firebase';
import { Header, Button, CardSection, Spinner } from './components/common'; // Looks at the index.js file inside of the common directory
import LoginForm from './components/LoginForm'

class App extends Component {
  // User logged in State
  state = { loggedIn: null };

  componentWillMount() {
    // Firebase connection for our Database bucket
    firebase.initializeApp({
      apiKey: "AIzaSyCYtj_TxdWyVhwr42TT-Q9pvniNZpFRN9c",
      authDomain: "authentication-888a9.firebaseapp.com",
      databaseURL: "https://authentication-888a9.firebaseio.com",
      projectId: "authentication-888a9",
      storageBucket: "authentication-888a9.appspot.com",
      messagingSenderId: "682620572715"
    });

  // Method for the firebase.auth object for handling login
    firebase.auth().onAuthStateChanged((user) => {
      if (user) {
        this.setState({ loggedIn: true });
      } else {
        this.setState({ loggedIn: false});
      }
    });
  }

  // Determines whether or not to show LoginForm//LogOut//Spinner
  renderContent() {
    switch (this.state.loggedIn) {
      case true:
        return (
          <CardSection>
            <Button onPress={() => firebase.auth().signOut()}>
              Log Out
            </Button>
          </CardSection>
        );
      case false:
        return <LoginForm />;
      default:
        return <Spinner size="large" />;
        }
      }

  render() {
    return (
      <View>
        <Header headerText="Authentication" />
        {this.renderContent()}
      </View>
    );
  }
}

export default App;
