# passkeys_example

This example demonstrates how to use the *passkeys* package.
We built it in a way to make it as easy to run as possible.

Therefore, we have set up a pre-configured instance of the relying party server using
a [Corbado](https://app.corbado.com) project.

The great thing about this is that you don't need to set up or configure a backend to run the
example.
Note, that you share this relying party server with all other users of the *passkeys* package that
also run the example though.
Therefore, we clear user data nightly.

## Troubleshooting

If you have any problems running this example, make sure to check out the [troubleshooting section](https://github.com/corbado/flutter-passkeys/blob/main/packages/passkeys/passkeys/README.md#troubleshooting) of 
this packages main README.md file.

Additionally to that check out the following list of errors that can happen specifically when running this example.

### iOS

#### Warning: XCode shows "Team: Unknown Name"

To allow for an easy setup in the example we configure it with a development team id of "
0000000000".
This is not a real development team id but as the example is only run on Simulators (and therefore
no real app signing takes place) this is not a problem.
You can still build and run the example on a Simulator.
If you change the development team id you will get an error on sign up/sign in
because the relying party server in the example only trusts apps that have been built with a
development team id of "0000000000" and a Bundle Identifier of "com.corbado.passkeys.pub".

<img src="https://raw.githubusercontent.com/corbado/flutter-passkeys/main/packages/passkeys/passkeys/doc/xcode-team-unknown-name.png" style="width: 50%" calt="ios_enrolled_biometrics">
