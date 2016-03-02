'use strict';

import React, {
  requireNativeComponent,
  Text,
  View
} from 'react-native';


var CustomRNView = requireNativeComponent('CustomRNView',null);

var styles = React.StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#ffefef",
    padding: 8
  }
});

class SimpleApp extends React.Component {
  render() {
    return (
      <View style={styles.container}>
        <Text>This is a React Native app.</Text>
        <CustomRNView message="message will be"/>
      </View>
    )
  }
}

React.AppRegistry.registerComponent('SimpleApp', () => SimpleApp);
