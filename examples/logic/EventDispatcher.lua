local EventDispatcher = oop.class()

function EventDispatcher:init()
	print('EventDispatcher:init')
end

function EventDispatcher:dispatchEvent(eventName)
	print('EventDispatcher:dispatchEvent:'..eventName)
end

return EventDispatcher
