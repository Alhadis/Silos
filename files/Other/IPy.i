/* 
 * IPy.i
 * The Image Processing in yorick package
 *
 * Developped by J. Exposito
 *
 */

require, "yeti.i";
require, "fft_utils.i";
require, "util_fr.i";

func ipy(void)
	/* DOCUMENT

	 IPy.i
	 The Image Processing in yorick package

	 Developped by J. Exposito

	 List of functions :
	 
		convert_jpg : convert .jpeg images into .fits format
					  gray  : convert .jpeg into .fits
					  color : convert .jpeg into .fits with prefix red/green/blue

		view_images	: display images for the selection

		makecube	: create a cube of data mandatory for registration

		quick_reg	: quick registration using the brightest pixel

		register	: fine registration

		makedark	: create a dark frame

		makeflat	: create a flat field frame
	 
		rgb			: Display a color image and return an array of "color" images

		makesky		: create a sky frame

		correlate	: compute the auto/cross-correlation between images

		wheremax	: return the position in pixel of the max of an array

		wind		: create a smart window to display images

		mesh_xy		: create a 3D array of coordinates in pixels

	*/
{return ;}


func view_images(path, pattern, first, last, extension, dir=)
	/* DOCUMENT

	view_images(path, pattern, first, last, extension, dir=)

	Function displaying images and move in a new directory unusable data if set.
	
	Valid extensions : .jpeg, .jpg, .JPG, .JPEG, and all .fits format.
	
	All jpeg data must be converted before registration using convert_jpg().

	path		: path to the data
	pattern		: recurrent pattern of the data
	first		: first number that varies in names of files
	last		: last number that varies in names 
	extension	: extension of the data files
	dir			: name of the directory where usunable data will be moved

	Example : 

	For data named IMG1.fits to IMG25.fits in the current directory,

	view_images(".", "IMG", 1, 25, ".fits", dir="./trash/")

	*/
{
	wind; // Create the window;
	
	/* Checking the synthax of dir */
	if (is_void(dir)) error, "No directory specified for bad data.";
	dirsynthax = strchar(dir);
	if (dirsynthax(-2) != strchar("/")(1)) dir = dir + "/";
	
	/* Create the directory, if it exists, no action */
	mkdirp, dir;
	
	/* Listing existing files */
	range	= indgen(first:last);
	names	= path + "/" + pattern + strtrim(swrite(range)) + extension;
	names	= names(where(fileExist(names)));
	n		= numberof(names);
	
	if (noneof(n)) 
	{
		write, "\n/!\\ No file exists ! Nothing to return.";
		return;
	}
	
	/* Taking into account the extension */
	if (extension == ".jpeg" || extension == ".JPEG" || extension == ".JPG" || extension == ".jpg")
	{
		read_im = jpeg_read;
	} else {
		read_im = fits_read;
	}

	
	/* Initialisation of the flag */
	answ	= 0;
	
	/* Loop on images */
	for (i=1 ; i<=n ; i++) {
		
		/* Displaying */
		fma; pli, read_im(names(i));
		/* Ask for action */
		write, "\n" + names(i);
		write, "\nPreserve the file ? 1: yes";
		write, "                   2: no";
		read, answ;
		
		/* If unusable image ... Displacement else no action */
		if (answ == 2) 
		{
			system("mv " + names(i) + " " + dir + names(i)); 
			write, "Moved to " + dir;
		} 
		else write, "Preserved...\n";

	}
}

func convert_jpg(path, pattern, first, last, extension)
/* DOCUMENT
 
 convert_jpg(path, pattern, first, last, extension, dir=)
 
 Convert .jpeg images into .fits images.
 
 For a black-and-white image IMG_1000.jpeg, the conversion create the file IMG_1000.fits.
 For a color image, the conversion create three files : red-IMG_1000.fits,
 green-IMG_1000.fits,
 blue-IMG_1000.fits.
 
 The .jpeg images are preserved.
 
 See view_images for the parameters description.
 
 */
{
	/* Listing existing files */
	range	= indgen(first:last);
	names	= path + "/" + pattern + strtrim(swrite(range)) + extension;
	prefix	=
	names	= names(where(fileExist(names)));
	n		= numberof(names);
	le		= strlen(extension)
	lp		= strlen(path + "/");
	
	if (noneof(n)) 
	{
		write, "\n/!\\ No file exists ! Nothing to return.";
		return;
	}
	write, "";
	
	/* Loop on images */
	for (i=1 ; i<=n ; i++) {
		
		write, "Converting image " + names(i); 
		im	= float(jpeg_read(names(i)));
		dim	= dimsof(im)(1);
		ll	= strlen(names(i));
		
		if (dim == 1) 
		{
			fits_write, strpart(names(i), 1:ll - le), im;
		} 
		else {
			fits_write, strpart(names(i), 1:lp) + "red-" + strpart(names(i), lp + 1:ll - le) + ".fits", im(1, ..);
			fits_write, strpart(names(i), 1:lp) + "green-" + strpart(names(i), lp + 1:ll - le) + ".fits", im(2, ..);
			fits_write, strpart(names(i), 1:lp) + "blue-" + strpart(names(i), lp + 1:ll - le) + ".fits", im(3, ..);
		}
		
	}
	
}

func makecube(path, pattern, first, last, extension)
	/* DOCUMENT
	
	cube = makecube(".", "IMG", #first image, #last image, ".fits")
	
	Return a cube of existing data. Missing data are not taken into account.
	
	path		: path to the data
	pattern		: recurrent pattern of the data
	first		: first number that vary in names of files
	last		: last number that vary in names 
	extension	: extension of the data files
	
	Example : 
	
	For data named IMG1.fits to IMG25.fits in the current directory,
	
	data = makecube(".", "IMG", 1, 25, ".fits")
	
	*/
{
	/* Listing existing files */
	range	= indgen(first:last);
	names	= path + "/" + pattern + strtrim(swrite(range)) + extension;
	names	= names(where(fileExist(names)));
	n		= numberof(names);
	
	if (noneof(n)) 
	{
		write, "\n/!\\ No file exists ! Nothing to return.";
		return;
	}
	
	/* Initialisation of the cube and parameters */
	im1			= fits_read(names(1));
	dim			= dimsof(im1);
	cube		= array(float, dim(2), dim(3), n);
	cube(.., 1)	= im1;
	
	/* Loop to built the cube */
	for (i=2 ; i<=n ; i++) {
	
		cube(.., i)	= fits_read(names(i));
		
	}
	
	return cube;
}


func makedark(cubedark, med=, verbose=) 
	/* DOCUMENT
	
	 makedark(cubedark, med=, verbose=)
	
	 */
{
	if (is_void(med) && verbose) write, "\nMaking averaged dark current...";
	if (!is_void(med) && verbose) write, "\nMaking median dark current...";
	if (dimsof(cubedark)(1)<3) return cubedark;
	if (is_void(med)) dark = cubedark(, , avg); else dark = median(cubedark, 3);

	return dark;
}

func makeflat(cubeflat, med=, verbose=)
	/* DOCUMENT

	 makeflat(cubedark, med=, verbose=)

	 Return flat field image normalized such as max(flat) = 1.

	 */
{
	if (is_void(med) && verbose) write, "\nMaking averaged flat field...";
	if (!is_void(med) && verbose) write, "\nMaking median flat field...";
	if (dimsof(cubeflat)(1)<3) return cubeflat / max(cubeflat);
	if (is_void(med)) {
		flat = cubeflat(, , avg);
	} else {
		flat = median(cubeflat, 3);
		flat /= max(flat);
	}
	return flat;
}

func makesky(cubesky, med=, verbose=)
	/* DOCUMENT

	 makesky(cubedark, med=, verbose=)

	 */
{
	if (is_void(med) && verbose) write, "\nMaking averaged sky...";
	if (!is_void(med) && verbose) write, "\nMaking median sky...";
	if (dimsof(cubesky)(1)<3) return cubesky;
	if (is_void(med)) sky = cubesky(, , avg); else sky = median(cubesky, 3);
	
	return sky;
}

func register(cubedata, method=, quick=, interpol=, \
			  xmin=, ymin=, dx=, dy=, starwidth=, \
			  flat=, sky=, dark=, med=, 
			  verbose=, disp=) 
	/* DOCUMENT 

	register(cubedata, method=, quick=, interpol=,
				xmin=, ymin=, dx=, dy=, starwidth=,
				flat=, sky=, dark=, med=, 
				verbose=, disp=)
	
	Register a serie of images.
	
	cubedata	: cube of images containing the data
	method		: method to use to register.
					Set to "c_cor" to use a cross-correlation method.
					Set to "wavelet" to use a wavelet decomposition before cross-correlation.
					Set to "star_fit" to use a Gaussian fitting on a star (xmin/ymin, dx, dy, starwidth are recommanded).
	quick		: Set to 1 to perform a quick registration with the "brightest pixel" method before the accurate one
	interpol	: method to interpolate the position of the maximum of correlation. 
					Set to "gaussian" for a gaussian fitting of the correlation function.
					Set to "sqare" for a second order polynomial fitting of the correlation function.
					Set to "no" to get only the position of the maximum of correlation.
	xmin/ymin	: coordinates of the left bottom corner of the sub-images
	dx			: width of the box
	dy			: height of the box
	starwidth	: estimated width of the star (not necessary for cross-correlation method but recommanded for the fit)
	flat		: the flat image or the cube containing the images of the flat field 
	sky			: image or cube of images containing the sky data
	dark		: image or cube of images containing the dark current data
	med			: set to 1 to performe the median on all the data
	verbose		: set to 1 if you want details
	disp		: set to 1 if you want a display of the median/averaged final image
	
	xmin/ymin, dx, dy, starwidth, order, flat, sky, dark, verbose and disp are optionnal parameters
	for the star fitting method but strongly recommended.
	These parameters are optional for cross-correlation/wavelet method.
	
	 */

{
	if ((method != "star_fit") && (method != "c_cor") && (method != "wavelet")) {
		write, "";
		write, "/!\\ Warning: No method was chosen for the registration. Cross-correlation will be used.";
		write, "";
		typeReturn;
		method	= "c_cor";
	}
	
	if (is_void(interpol)) {
		interpol	= "no";
		write, "";
		write, "/!\\ Warning: Interpolation set to 'No'";
		write, "";
	}
	
	/* Initialisation */
	dim0	= dimsof(cubedata);
	
	if (verbose) {
		write, "";
		write, format="%d %s", dim0(4), "Images will be registered.";
		write, "";
		write, format="%s %4d %s %4d", "\nDimensions of images: ", dim0(2), "x", dim0(3);
		write, "";
	}

	if (is_void(xmin)) xmin = 1;
	if (is_void(ymin)) ymin = 1;
	if (is_void(dy)) {
		if (is_void(dx)) {
			dx	= dim0(2);
			dy	= dim0(3);
		} else dy	= dx;
	}
	
	if (is_void(starwidth)) starwidth = 4.;

	if (!is_void(dark)) dark = makedark(dark, med=med, verbose=verbose); else dark = 0.;
	
	if (!is_void(flat)) {
		flat	= makeflat(flat, med=med, verbose=verbose) - dark;
	} else flat = 1.;
	
	if (!is_void(sky))  sky  = makesky(sky, med=med, verbose=verbose); else sky = 0.;
		
	winkill, 0; winkill, 1;

	if (quick) {
		if (verbose) write, "\n\rQuick registration ...";
		cubedata = quick_reg(cubedata);
	}

	if (method == "star_fit") {
		/* Using star fitting method */
			
		/* Definition of sub-images containing the star */
		if (verbose) write, format="%s %4d %s %4d %s %4d %s %4d", "\nCreating sub-images:\nxmin =", 
			xmin, "\ndx   =", dx, "\nymin =", ymin, "\ndy   =", dy;
		
		sscube	= cubedata(xmin:xmin+dx-1, ymin:ymin+dy-1, );
		dim		= dimsof(sscube);
		xy		= mesh_xy(dim(2), dim(3));
		
		if (verbose) write, "\n\nFirst image as the reference";
		
		Imref	= sscube(.., 1); // First image as the reference
		
		if (verbose) write,format="%s %4d %s %4d", "Dimensions of sub-images: ", dim(2), "x", dim(3);
		
		/* Reference parameters */
		if (verbose) write, "\n\nEstimation of parameters for gaussian fit on star"
		ref		= wheremax(Imref);
		xref	= ref(1);
		yref	= ref(2);
		Iref	= Imref(lround(xref), lround(yref));
		dxref	= starwidth; /* Estimated width of a star */
		dyref	= dxref;
		

		/* Gaussian fit on the reference star */
		if (verbose) write, "\nFitting the star...";
		
		param	= [Iref, xref, yref, dxref, dyref, 0., Imref(avg)];
		res		= lmfit(gauss2d, xy, param, Imref, 1., deriv=1, itmax=5000, fit=[1, 2, 3, 4, 5, 7]);

		if (verbose)
		{
			write, "\nEstimated parameter for the reference star:";
			write, format="%s %#3.3f %s %#3.3f", "\nposition of the star: x  =", param(2), "y  =", param(3);
			write, format="%s %#3.3f %s %#3.3f", "\ngaussian sigma      : dx =", param(4), " dy =",param(5);
		}
			
		/* Registration */
		
		if (verbose) write, "\n\nCreating larger images for the shift...";
		
		/* Making a bigger cube to shift images */
		regcube	= array(0., [dim0(1), 2*dim0(2), 2*dim0(3), dim0(4)]);
		dim2	= dimsof(regcube);
		
		/* At the center of the bigger image */
		regcube(dim2(2)/4:3*dim2(2)/4-1, dim2(3)/4:3*dim2(3)/4-1, 1) = (cubedata(.., 1) - sky) / flat;
		
		i=1;
		if (verbose) write, format="%s %d%s %#3.3f %#3.3f", "\nEstimated shifts:\nImage #", i, ":", 0., 0.;
	
		for (i=2 ; i<=dim(4) ; i++) {
	
		par		= param;
		ind		= wheremax(sscube(.., i));
	
		par(1)	= max(sscube(.., i));
		par(2)	= ind(1);
		par(3)	= ind(2);
		par(7)	= sscube(.., i)(avg);
	
		res		= lmfit(gauss2d, xy, par, sscube(.., i), 1., deriv=1, \
						itmax=5000, fit=[1, 2, 3, 4, 5, 7], tol = 1.e-3);
		
		regcube(dim2(2)/4:3*dim2(2)/4-1, dim2(3)/4:3*dim2(3)/4-1, i) = (cubedata(.., i) - sky) / flat;
	
		/* Shift */
		regcube(.., i)	= fft_fine_shift(regcube(.., i), [-(par(2) - xref), -(par(3) - yref)]);
	
		if (verbose) write, format="%s %d%s %#3.3f %#3.3f", "\nImage #", i, ":", par(2)-xref, par(3)-yref;

		}
	
	} else {
		/* Using cross-correlation method or wavelet */
		
		if (method == "c_cor") { // Wavelet or cross-correlation. First Image as reference.
			Imref = cubedata(xmin:xmin+dx-1, ymin:ymin+dy-1, 1)
		} else {
			Imref = yeti_wavelet(cubedata(xmin:xmin+dx-1, ymin:ymin+dy-1, 1), 5)(.., [3, 4, 5])(.., sum);
		}
		
		cor		= array(float, [2, 2 * dx, 2 * dy])(, , -::dim0(4)-1);
		dim		= dimsof(cor);
		
		if (verbose) {
			write, format="%s %4d %s %4d %s %4d %s %4d", "\nCreating sub-images:\nxmin =", 
			xmin, "\ndx   =", dx, "\nymin =", ymin, "\ndy   =", dy;
			write, "";
		}
		
		/* Computing the cross-correlation */
		if (verbose) write, "\n\rComputing cross-correlations...";
		
		cor_ref	= imc = cor(.., 1);
		cor_ref(xmin:xmin+dx-1, ymin:ymin+dy-1)	= Imref;
		
		if (method == "c_cor") { // Wavelet or cross-correlation.
			for (i=1 ; i<= dim0(4) ; i++) {
				imc(xmin:xmin+dx-1, ymin:ymin+dy-1)	= cubedata(xmin:xmin+dx-1, ymin:ymin+dy-1, i);
				cor(.., i)							= roll(correlate(cor_ref, imc).re);
			}
		} else {
			for (i=1 ; i<= dim0(4) ; i++) {
				imc(xmin:xmin+dx-1, ymin:ymin+dy-1)	= yeti_wavelet(cubedata(xmin:xmin+dx-1, ymin:ymin+dy-1, i), 5)(.., [3, 4, 5])(.., sum);
				cor(.., i)							= roll(correlate(cor_ref, imc).re);
			}
		}
		
		ref		= float(wheremax(cor(.., 1)));
		xref	= ref(1);
		yref	= ref(2);
		
		if (verbose) {
			write, format="%s %s %3.3f\n", "\nPosition of the maximum of correlation:", "x = ", xref-1;
			write, format="%s %3.3f"   , "                                        y = ", yref-1;
			write, "";
		}
		
		/* Registration */
		
		if (verbose) write, "\n\nCreating larger images for the shift...";
		/* Making a bigger cube to shift images */
		regcube	= array(0., [dim0(1), 2*dim0(2), 2*dim0(3), dim0(4)]);
		dim2	= dimsof(regcube);
		
		/* At the center of the biggest image */
		regcube(dim2(2)/4:3*dim2(2)/4-1, dim2(3)/4:3*dim2(3)/4-1, 1) = (cubedata(.., 1) - sky) / flat;
		
		i		= 1;
		xy		= mesh_xy(dim(2), dim(3));
		
		if (verbose) write, format="%s %d%s %#3.3f %#3.3f", "\nEstimated shifts:\nImage #", i, ":", 0., 0.;
		
		/* Gaussian fitting */
		for (i=2 ; i<=dim(4) ; i++) {
			
			if (interpol == "gaussian") {
				subcor	= cor(.., i);
				Icor	= max(subcor);
				pos		= wheremax(subcor)(, 1); // case for several maxima
				xpos	= pos(1);
				ypos	= pos(2);
				dy		= dx = sqrt((numberof(where(subcor >= 0.5 * Icor)))/pi);
				weight	= subcor * 0.;
				weight(where(subcor >= 0.3 * Icor)) = 1.;
				
				param	= [Icor, xpos, ypos, dx, dy, 0., subcor(avg)];
				
				res		= lmfit(gauss2d, xy, param, subcor, 1., deriv=1, \
								itmax=5000, fit=[1, 2, 3, 4, 5, 7], tol=1.e-4);
				
			} else if (interpol == "square") {
				subcor	= cor(.., i);
				offset	= max(subcor); // Max because decreasing correlation 
				pos		= wheremax(subcor)(, 1); // case for several maxima
				x0		= pos(1);
				y0		= pos(2);
				ax		= (subcor(y0, x0+3) - offset) / ((x0 + 3)^2 - x0^2); // estimation of coefficients
				ay		= (subcor(x0+3, y0) - offset) / ((y0 + 3)^2 - x0^2);
				
				param	= [ax, ay, x0, y0, offset];
				
				weight	= subcor * 0.;
				weight(x0-5:x0+5, y0-5:y0+5)	= 1.; // fit on 11x11 square pixels around the maximum
				
				res		= lmfit(trinome, xy, param, subcor, weight, deriv=1, \
								itmax=5000, tol=1.e-4);
				param	= [0., param(3), param(4)];
				
			} else if (interpol == "no") {
				subcor	= cor(.., i);
				shifts	= wheremax(subcor);
				param	= [0., shifts(1), shifts(2)]; // to respect dx = param(2) & dy = param(3)
			}
			
			regcube(dim2(2)/4:3*dim2(2)/4-1, dim2(3)/4:3*dim2(3)/4-1, i) = (cubedata(.., i) - sky) / flat;
			
			/* Shift */
			regcube(.., i)	= fft_fine_shift(regcube(.., i), [-(param(2) - xref), -(param(3) - yref)]);

			if (verbose) write, format="%s %d%s %#3.3f %#3.3f", "\nImage #", i, ":", param(2)-xref, param(3)-yref;
			
		}
		
	}
	
	/* Resizing registered images to their original sizes */
	regcube	= regcube(dim2(2)/4:3*dim2(2)/4-1, dim2(3)/4:3*dim2(3)/4-1, );
	
	if (disp) 
	{
		wind;
		if (med) {
			pli, median(regcube, 3);
		} else pli, regcube(.., avg);
	}
	
	write, "";
	
	return regcube;
}

func quick_reg(cubedata)
	/* DOCUMENT
		quick_reg(cubedata)
	 
		Fast registration using the brightest pixel to estimate the shift.
	 
		SEE ALSO: register
	 */
{
	if (is_void(cubedata)) error, "No data to register.";
	
	n			= dimsof(cubedata)(4);
	im			= cubedata * 0.;
	
	im(.., 1)	= cubedata(.., 1);
	ref			= wheremax(cubedata(.., 1));
	xref		= ref(1);
	yref		= ref(2);
	
	for (i=2 ; i<=n ; ++i) {
		posmax		= wheremax(cubedata(.., i));
		dx			= posmax(1) - xref;
		dy			= posmax(2) - yref;
		im(.., i)	= roll(cubedata(.., i), [-dx, -dy]);
	}
	
	return im;
}

func rgb(red, green, blue, scale=)
	/* DOCUMENT
 
	 Display and return a composite color image with red/green/blue images.
	 
	 Red/green/blue must have the same dimensions.
	 
	 The array returned is rgb = [red, green, blue] type 
	 and rgb = array(char, 3, x_dimension, y_dimension);
	 
	 The parameter scale is set to : 
	 
		- "linear" by default,
		- "log" for a log scaling of the pixels,
		- "sqrt" for a square root scaling.
 
	 */
{

	if (scale == "log")
	{
		red		= log10(red - min(red) + 1.);
		green	= log10(green - min(green) + 1.);
		blue	= log10(blue - min(blue) + 1.);
	}
	if (scale == "sqrt")
	{
		red		= sqrt(red - min(red));
		green	= sqrt(green - min(green));
		blue	= sqrt(blue - min(blue));
	}
	
	red		= bytscl(red);
	green	= bytscl(green);
	blue	= bytscl(blue);

	RGB		= transpose([transpose(red), transpose(green), transpose(blue)]); // transpose to keep the orientation
	
	wind;
	
	pli, RGB;
	
	return RGB;
}

/*func r0_estim(im)
	/*	DOCUMENT
	 
		Rough r0 estimation (in pixels) for Speckel images
	 
	 */
/*{
	dim				= dimsof(im);
	xy				= mesh_xy(dim(2), dim(3));
	pos				= wheremax(im);
	xpos			= pos(1);
	ypos			= pos(2);
	Imax			= im(xpos, ypos);
	dy				= dx = 10.;
	w				= im * 0. + 1.;
	w(xpos, ypos)	= 0;
	
	param	= [Imax, xpos, ypos, dx, dy, 0., min(im)];
	
	res		= lmfit(gauss2d, xy, param, im, w, deriv=1, \
					itmax=2000, fit=[1, 2, 3, 4, 5, 7], tol=1.e-3);
	
	return 2. * avg(param([4, 5]));
}*/

func speckle(cubedata)
	/* DOCUMENT
 

 
	 */
{
	n		= dimsof(cubedata)(4);
	
	S		= cubedata(.., 1) * 0.; // power spectrum
	
	for (i=1 ; i<=n ; ++i) {
		S	+= abs(fft(cubedata(.., i), 1))^2;
	}
	S		/= max(S);
	
	//im_tot	= smooth(quick_reg(cubedata), 20);
	//B		= abs(fft(im_tot))^2;
	//B		/= max(B);
	
	R		= S /// B//fft(S).re; // Restored image

	wind;
	pli, roll(R);
	
	return roll(R);
}


func mesh_xy(dim_x, dim_y)
	/* DOCUMENT
	
	xy	= mesh_xy(dim_x, dim_y) [= array(long, dim_x, dim_y, 2)]
	
	Create a 3D array where
	
	x	= xy(..,1)
	y	= xy(..,2)
	
	and x and y are 2D array
	
	*/
{
	if (dim_x == 0 || dim_y == 0) 
	{
		write, "/!\\ Warning: dimensions must be greater than zero. (at mesh_xy)";
		return;
	}
	
	xy	= [indgen(dim_x)(, -:1:dim_y), indgen(dim_y)(-:1:dim_x, )];
	
	return xy;	
}

func correlate(f, g, dir=)
	/* DOCUMENT

	cor = correlate(f, g, dir=)

	Return the correlation between array f and array g using FFT
	with normalisation.

	See the FFT function for DIR parameter. By default dir = 1.

	For auto-correlation, auto_cor = correlate(f, f, dir=)
	
	*/
{

	if (is_void(f) || is_void(g)) error, "Empty array ! Two arrays are required.";
	if (is_void(dir)) dir = 1; 
	
	cor	= fft(conj(fft(f, dir)) * fft(g, dir), -dir) / numberof(f);
	
	return cor;
}

func trinome(xy, a, &grad, deriv=)
	/* DOCUMENT
 
		y = I0x * (x - x0)^2 + I0y * (y - y0)^2 + c;
	 
		a(1) : I0x
		a(2) : I0y
		a(3) : x0
		a(4) : y0
		a(5) : offset = c
 
	 */
{
	n	= numberof(a);
	x	= xy(.., 1);
	y	= xy(.., 2);
	I0x	= a(1);
	I0y	= a(2);
	x0	= a(3);
	y0	= a(4);
	c	= a(5);
	p	= I0x * (x - x0)^2 + I0y * (y - y0)^2 + c;
	
	if (deriv) {
		grad		= x(,,-:1:n) * 0.;
		grad(, , 1)	= (x - x0)^2;
		grad(, , 2)	= (y - y0)^2;
		grad(, , 3)	= -2. * I0x * (x - x0);
		grad(, , 4)	= -2. * I0y * (y - y0);
		grad(, , 5)	= 1.;
	}
	
	return p;
}

func wheremax(array)
	/* DOCUMENT

	pos	= wheremax(array)

	Return the coordinates of the position in the array of the
	maximum value of the array in pixel.

	*/
{
	posmax	= where2(array == max(array))(, 1);
	
	return posmax;
}

func wind(n, dpi=, palet=, style=)
	/* DOCUMENT
	
	Create a window (dpi = 120, style nobox, squared limits & gray color)
	
	SEE ALSO : window
	*/
{
	if (is_void(n))		n		= 0;
	if (is_void(dpi))	dpi		= 120;
	if (is_void(palet))	palet	= "gray.gp";
	if (is_void(style))	style	= "nobox.gs";
	
	winkill, n;
	window, n, dpi=dpi, style=style;
	limits, square=1;
	palette, palet;
	
	return;
}