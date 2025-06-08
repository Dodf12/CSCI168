camera
{
    location <1, 1, -9>
    look_at <0, 0, 0>
}

light_source {<-2, +1, -5>, colour rgb 1}
light_source {<0, +2, 0>, colour rgb 1}

object
{
    lathe {
        quadratic_spline
        27,
        <0.5, 0>,
        <0.40, 0.05>,
        <0.55, 0.3>,
        <0.60, 0.4>,
        <0.65, 0.5>,
        <0.70, 0.6>,
        <0.75, 0.7>,
        <0.80, 0.8>,
        <0.85, 0.9>,
        <0.95, 1.1>,
        <1.05, 1.3>,
        <1.08, 1.4>,
        <1.11, 1.5>,
        <1.14, 1.6>,
        <1.16, 1.7>,
        <1.18, 1.8>,
        <1.20, 1.9>,
        <1.21, 2.0>,
        <1.24, 2.3>,
        <1.25, 2.5>,
        <1.24, 2.6>,
        <1.21, 2.75>,
        <1.18, 3.05>,
        <1.0, 3.35>,
        <0.6, 3.65>,
        <0.7, 3.72>,
        <0.8, 3.85>
        sturm
    }

    texture
    {
        pigment {
            image_map {
                jpeg "/Users/deepikadasari/Documents/Abhi/SCU/Courswork/FreshmanYear(2024-2025)/Untitled/CSCI168/Homework/Homework9/vaseTexture.jpeg"
                map_type 1
                interpolate 2
            }
            scale <0.5, 1, 1>
        }
        finish
        {
            ambient 0
            diffuse 0.7
            specular 0.5
        }
    }
}