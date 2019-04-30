from sense_hat import SenseHat, ACTION_PRESSED
from datetime import datetime

sense = SenseHat()
sense.set_imu_config(False, True, True); #gyro and accel

file = raw_input('Enter file name: ')
file = "./MotionCaptures/" + file + ".csv"
f = open(file, "w");

# Progress indicator
sense.set_pixel(0,0, 0, 255, 0); #green light to indicate ready

flag = True

while flag:
        # take data measurements
	accel = sense.get_accelerometer_raw()
        orient = sense.get_gyroscope_raw()

        # access variables
	x = accel['x']
	y = accel['y']
	z = accel['z']
        p = orient['x']
        r = orient['y']
        y = orient['z']

        # write to CSV
	f.write("{0},{1},{2},{3},{4},{5}\n".format(x, y, z, p, r, y))

        #check for joystick event to stop gathering data
        for event in sense.stick.get_events():
           if event.action == ACTION_PRESSED:
              flag = False


#end of program
sense.clear()
f.close()
print("Complete!")
