# GM Input Test

This project demonstrates GM's keyboard, mouse, and gamepad APIs to help debugging issues related to these APIs.

## Keyboard and Mouse

`o_keyboard_mouse_input` logs the current reading of keyboard and mouse inputs.

## Gamepad

`objController` instantiates `objControllerSupport` when gamepads are detected from the async System events.

## Test Cases

### GamePad Input

+ [manual] Gamepad key mapping is correct
+ [manual] Gamepad will not be undetectable after losing focus

### Mouse Input

+ [manual] Mouse wheel up and down are properly registered
+ [manual] Mouse or touch clicks do not register additional input
+ [manual] Mouse re-spriting or hiding works
