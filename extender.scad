$fn=50;

$plateHeight = 10;
$insideHeight = 40;

$outside = 50.5;
$inside = $outside-2*3;

difference() {
    union () {
        difference() {
            // main block
            cube([$inside,$inside,$insideHeight*2+$plateHeight], true);

            // side cutouts
            $sideCutoutRadius=12;
            translate([0,$inside/2,0]) 
                cylinder($insideHeight*2+$plateHeight+2,$sideCutoutRadius,$sideCutoutRadius, true);
            translate([0,-$inside/2,0]) 
                cylinder($insideHeight*2+$plateHeight+2,$sideCutoutRadius,$sideCutoutRadius, true);
            translate([$inside/2,0,0]) 
                cylinder($insideHeight*2+$plateHeight+2,$sideCutoutRadius,$sideCutoutRadius, true);
            translate([-$inside/2,0,0]) 
                cylinder($insideHeight*2+$plateHeight+2,$sideCutoutRadius,$sideCutoutRadius, true);
            
            // corner cutouts
            $cornerCutoutRadius=2;
            translate([$inside/2,$inside/2,0]) 
                cylinder($insideHeight*2+$plateHeight+2,$cornerCutoutRadius,$cornerCutoutRadius, true);
            translate([$inside/2,-$inside/2,0])
                cylinder($insideHeight*2+$plateHeight+2,$cornerCutoutRadius,$cornerCutoutRadius, true);
            translate([-$inside/2,$inside/2,0])
                cylinder($insideHeight*2+$plateHeight+2,$cornerCutoutRadius,$cornerCutoutRadius, true);
            translate([-$inside/2,-$inside/2,0])
                cylinder($insideHeight*2+$plateHeight+2,$cornerCutoutRadius,$cornerCutoutRadius, true);
        }

        // center plate
        difference() {
            translate([0,0,0]) cube([$outside,$outside,$plateHeight], true);
            
            $cornerRadius=2;
            translate([$outside/2,$outside/2,0]) corner($cornerRadius, $plateHeight);
            translate([-$outside/2,$outside/2,0]) rotate([0,0,90]) corner($cornerRadius, $plateHeight);
            translate([-$outside/2,-$outside/2,0]) rotate([0,0,180]) corner($cornerRadius, $plateHeight);
            translate([$outside/2,-$outside/2,0]) rotate([0,0,270]) corner($cornerRadius, $plateHeight);
        }
    }
    // center cutout
    $centerRadius=5;
    translate([0,0,0]) cylinder($insideHeight*2+$plateHeight+2,$centerRadius,$centerRadius, true);
}

module corner ($radius, $height) {
    difference() {
        cube([$radius*2,$radius*2,$height+2], true);
        translate([-$radius,-$radius,0])
            cylinder($height+2, $radius, $radius, true);
    }
}