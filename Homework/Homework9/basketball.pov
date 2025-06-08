// Clock initial: 0.0
// Clock End(1.0): 250
// Final Frame: 1000

camera {
    location <0, 30, -180>
    look_at <0, 10, 0>
    angle 30
}

light_source { <0, 100, -100> color rgb 1 }
light_source { <0, 100, 100> color rgb 1 }

// Floor 
plane {
    y, -10
    pigment { color rgb <0.8, 0.8, 0.8> }
    finish { diffuse 0.8 }
}

// Wall
plane {
    z, 50
    pigment { color rgb<1, 1, 0.8> }
    finish { diffuse 0.8 }
}

//Physics stuff
#declare g = 9.8;
#declare bounce_loss = 0.7;
#declare x_accel = 1;
#declare x_vel0 = 0.5;
#declare x0 = -50;
#declare y0 = 30;
#declare v0 = -5;


//For smoother framerate/animation
#declare t_time = clock * 6;

//FOr the ball moving sideways
#declare x_dimension = x0;
#declare vx = x_vel0;
#declare tx = t_time;
#while (x_dimension > 150)
    #declare x_dimension = x_dimension - (150 + 50);
    #declare tx = tx - ((150 - x0) / x_vel0);
#end
#declare x_dimension = x0 + x_vel0 * tx + 0.5 * x_accel * tx * tx;
#declare vx = x_vel0 + x_accel * tx;

// Motion vertically
#declare time = t_time;
#declare y_dimension = y0;
#declare vy = v0;
#declare t_accum = 0;


#declare t_bounce = ( -vy + sqrt(vy*vy + 2*g*y_dimension) ) / g;

#while (time > t_accum + t_bounce)
    #declare t_accum = t_accum + t_bounce;
    // Velocity just before bounce
    #declare v_impact = vy - g * t_bounce;
    #declare vy = abs(v_impact) * bounce_loss; 
    #declare y_dimension = 0;
    #declare t_bounce = 2 * abs(vy) / g;
#end

#declare t_local = time - t_accum;
#declare currentHeight = y_dimension + vy * t_local - 0.5 * g * t_local * t_local;
#declare currentHeight = max(currentHeight, 0);

//Ball itself
sphere {
    <x_dimension, currentHeight + 5, 7>, 5
    texture {
        pigment {
            image_map {
                jpeg "/Users/deepikadasari/Documents/Abhi/SCU/Courswork/FreshmanYear(2024-2025)/Untitled/CSCI168/Homework/Homework9/bball_Texture.jpeg"
                map_type 1
            }
            scale <0.05, 0.05, 0.05>
        }
    finish { 
        //attempted many many times to get the texutre of the ball right, but it doesnt work and it is really really irritating(please dont dock me )
        ambient 0.3
        diffuse 0.7
        phong 0.05
        phong_size 10
        roughness 0.2
    }
        
    }
}