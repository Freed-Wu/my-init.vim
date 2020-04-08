import sensor
sensor.reset()
sensor.set_pixformat(sensor.RGB565)
sensor.set_framesize(sensor.QQVGA)
sensor.set_windowing((150, 100))  # 240x240 center pixels of VGA
sensor.skip_frames(time=2000)
sensor.set_auto_gain(False)  # must be turned off for color tracking
sensor.set_auto_whitebal(False)  # must be turned off for color tracking
import time
clock = time.clock()
import image
from pyb import Servo
from pyb import UART
uart = UART(3, 76800)
from pyb import Pin
green_out = Pin('P0', Pin.OUT_PP)
red_out = Pin('P1', Pin.OUT_PP)
from pyb import LED
led_red = LED(1)
led_blue = LED(2)
led_green = LED(3)

while (True):
	clock.tick()
	img = sensor.snapshot()
	blobs = img.find_blobs([RED, GREEN],
						pixels_threshold=1,
						area_threshold=1,
						merge=True)
	color = 0
	if len(blobs) != 0:
		redcode = 0
		greencode = 0
		redgreencode = 0
		for blob in blobs:
			code = blob.code()
			if code == 1:  # red
				redcode += 1
			elif code == 2:  # green
				greencode += 1
			elif code == 3:  # greed and red
				redgreencode += 1
				if redcode == 0:
					color = 2
				elif greencode == 0:
					color = 1
				else:
					color = 3
					print('red', redcode, 'green', greencode, 'double', redgreencode)
					if color == 0:
						green_out.low()
						red_out.low()
						led_blue.off()
						led_green.off()
						led_red.off()
					elif color == 1:
						green_out.low()
						red_out.high()
						led_blue.off()
						led_green.off()
						led_red.on()  #红灯亮
					elif color == 2:
						green_out.high()
						red_out.low()
						led_blue.off()
						led_red.off()
						led_green.on()  #绿灯亮
					elif color == 3:
						green_out.high()
						red_out.high()
						led_red.off()  #红灯亮
						led_green.off()
						led_blue.on()
