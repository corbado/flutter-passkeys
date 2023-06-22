# Passkeys
This is only meant for internal devs to explain this repos main ideas.

## Current state:
- iOS plugin implemented (passkeys_ios)
- simple example (passkeys/example)
- basic implementation of the flutter package (passkeys/lib)

## Open TODOs:
- extend the documentation in our code (some comments exist in passkeys_platform_interface)
- android plugin (passkeys_android => must be added)
- tests (for every plugin, for the app-facing flutter part)
- finalize the interface of the PasskeyBackend (currently it could only return the sessionToken => do we want to return a user here as well?)
- provide good examples and a README that explains all steps for setting up iOS/android
- think of firebase integration (we would have to write a firebase extension for that)
- set up CI (e.g. GitHub actions)

## Important ideas:

### Federated plugins 
Federated plugins have been used to structure the repo (https://docs.flutter.dev/packages-and-plugins/developing-packages#federated-plugins).
**Why:** 
Google seems to endorse this structure. => Most of its flutter plugin packages follow this approach.

Examples:
- https://github.com/firebase/flutterfire/tree/master/packages
- https://github.com/flutter/packages/tree/main/packages

### Code generation using pigeon
The "glue code" that is required to communicate between flutter and the platform is generated using pigeon.
https://pub.dev/packages/pigeon

**Why:**
Google seems to endorse this a lot => => Most of its flutter plugin packages follow this approach.
We save write quite a bit of code. Basically, all we need to do is implement an interface on the platform side.
We don't have to think anymore about how to send/receive from the flutter part.

### Code generation using openapi_generator
The client code that is required to call the Corbado API endpoints for registration and authentication.
Using a code generator saves us from writing glue code.
TODO: Our current openapi.yaml contains some very broad types (e.g. challenge is of type string instead of being a type object).
This requires us to write some additional code for deserialization/serialization. 
By having a more specific openapi spec we could maybe get rid of that code as well.

## Important commands:
1) Generate pigeons: `flutter pub run pigeon --input pigeons/messages.dart`
2) Generate openapi client: `flutter pub run build_runner build`

## How to test manually
Currently we need to do manual testing.

### iOS
Run the example in *passkeys/example/lib/main.dart* on an iOS simulator.
Adapt projectID and email address in that example.
You have to setup a Corbado project if you haven't already done that and create an iOS integration (you need your bundle identifier + application identifier prefix for that).
Now you can click on "register" first and then on "authenticate".
Currently, you have to confirm the email that is sent to your email address after the register step.
Otherwise the "authenticate" step will fail.