instance_destroy(obj_button_play_paused);
instance_destroy(obj_button_home);
instance_destroy(obj_button_retry);

audio_sound_gain(global.music, 1.0, 4000);
audio_sound_pitch(global.music, 1.0);