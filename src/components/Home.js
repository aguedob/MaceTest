import React from 'react';
import {
  SafeAreaView,
  StyleSheet,
  ScrollView,
  View,
  Text,
  StatusBar,
  TouchableOpacity,
} from 'react-native';

class Home extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <>
        <StatusBar barStyle="dark-content" />
        <SafeAreaView style={styles.body}>
          <ScrollView
            contentInsetAdjustmentBehavior="automatic"
            contentContainerStyle={styles.scrollViewContainer}
            style={styles.scrollView}>
            <View style={styles.body}>
              <View style={styles.sectionTitle}>
                <Text style={styles.sectionTitleText}>Mace Test</Text>
              </View>
              <View style={styles.sectionContainer}>
                <TouchableOpacity
                  onPress={() => this.props.navigation.navigate('Train')}
                  style={styles.button}>
                  <Text style={styles.buttonText}>Train</Text>
                </TouchableOpacity>
                <TouchableOpacity
                  onPress={() => this.props.navigation.navigate('Test')}
                  style={styles.button}>
                  <Text style={styles.buttonText}>Test</Text>
                </TouchableOpacity>
              </View>
            </View>
          </ScrollView>
        </SafeAreaView>
      </>
    );
  }
}

export default Home;

const styles = StyleSheet.create({
  scrollView: {
    backgroundColor: 'blue',
    width: '100%',
  },
  body: {
    backgroundColor: 'white',
    alignItems: 'center',
    flex: 1,
  },
  scrollViewContainer: {
    flexGrow: 1,
  },
  sectionTitle: {
    flex: 0.2,
    justifyContent: 'center',
  },
  sectionContainer: {
    flex: 0.4,
    justifyContent: 'center',
  },
  sectionTitleText: {
    fontWeight: 'bold',
    fontSize: 20,
  },
  button: {
    padding: 20,
    margin: 10,
    backgroundColor: '#202646',
    borderRadius: 5,
    width: 200,
    alignItems: 'center',
  },
  buttonText: {
    color: 'white',
    fontSize: 18,
  },
});
