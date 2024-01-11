has_hit = false;

var _alert_high = instance_create_layer(room_width - 100, y - 100, "GUI", obj_alert);
_alert_high.owner = self;

var _alert_low = instance_create_layer(room_width - 100, y + 100, "GUI", obj_alert);
_alert_low.owner = self;