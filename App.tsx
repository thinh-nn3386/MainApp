/* eslint-disable react-native/no-inline-styles */
/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 */

import React from 'react';
import {
  SafeAreaView,
  StatusBar,
  Text,
  TouchableOpacity,
  View,
  NativeModules,
} from 'react-native';

const MiniappManager = NativeModules.MiniappManager;

export const useExitApp = () => {
  return {
    closeApp: MiniappManager ? MiniappManager.closeApp : () => {},
  };
};

function App(): JSX.Element {
  return (
    <SafeAreaView
      style={{
        flex: 1,
      }}>
      <StatusBar barStyle={'dark-content'} backgroundColor={'white'} />
      <View
        style={{
          flex: 1,
          justifyContent: 'center',
          alignItems: 'center',
          backgroundColor: 'white',
        }}>
        <TouchableOpacity
          style={{
            padding: 16,
            backgroundColor: 'gray',
            borderRadius: 12,
          }}
          onPress={() => {
            MiniappManager.openApp({});
          }}>
          <Text
            style={{
              fontWeight: '500',
              color: 'black',
            }}>
            Open Miniapp
          </Text>
        </TouchableOpacity>
      </View>
    </SafeAreaView>
  );
}

export default App;
