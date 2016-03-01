'use strict';

import React, {
  requireNativeComponent,
  Text,
  View
} from 'react-native';


class MessageView extends React.Component {
  render() {
    return <CustomRNView message={this.props.message}/>
  }
}
MessageView.propTypes = {
  message: React.PropTypes.string
}
var CustomRNView = requireNativeComponent('CustomRNView',MessageView);

var styles = React.StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: 'gray'
  }
});

class SimpleApp extends React.Component {
  render() {
    return (
      <View style={styles.container}>
        <Text>This is a React Native app</Text>
        <MessageView message="Hello world "/>
      </View>
    )
  }
}

React.AppRegistry.registerComponent('SimpleApp', () => SimpleApp);
