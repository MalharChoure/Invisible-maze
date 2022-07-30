BaseState = Class{}

function BaseState:init() end
function BaseState:enter(enterParams) end
function BaseState:exit() end
function BaseState:update(dt) end
function BaseState:render() end
function BaseState:checking(x,y) end
function BaseState:check_key_released(key) end
function BaseState:check_key_pressed(key) end
