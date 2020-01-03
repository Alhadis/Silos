#line 1 "fatfs\\ff.c"












































































 

#line 1 "fatfs\\ff.h"













 




#line 1 "fatfs\\integer.h"
 
 
 







 
typedef int				INT;
typedef unsigned int	UINT;

 
typedef signed char		CHAR;
typedef unsigned char	UCHAR;
typedef unsigned char	BYTE;

 
typedef short			SHORT;
typedef unsigned short	USHORT;
typedef unsigned short	WORD;
typedef unsigned short	WCHAR;

 
typedef long			LONG;
typedef unsigned long	ULONG;
typedef unsigned long	DWORD;

 
typedef enum { FALSE = 0, TRUE } BOOL;



#line 20 "fatfs\\ff.h"
#line 1 "fatfs\\ffconf.h"







 






 




 





 









 



 



 



 





 































 












 





 





 





 


 








 





 





 











 










 


#line 21 "fatfs\\ff.h"






 

#line 38 "fatfs\\ff.h"

#line 219 "fatfs\\ff.h"



 


















#line 247 "fatfs\\ff.h"



 

#line 265 "fatfs\\ff.h"








 




#line 285 "fatfs\\ff.h"



 




typedef char XCHAR;		 




 

typedef struct _FATFS_ {
	BYTE	fs_type;	 
	BYTE	drive;		 
	BYTE	csize;		 
	BYTE	n_fats;		 
	BYTE	wflag;		 
	BYTE	fsi_flag;	 
	WORD	id;			 
	WORD	n_rootdir;	 
#line 316 "fatfs\\ff.h"
	DWORD	last_clust;	 
	DWORD	free_clust;	 
	DWORD	fsi_sector;	 




	DWORD	sects_fat;	 
	DWORD	max_clust;	 
	DWORD	fatbase;	 
	DWORD	dirbase;	 
	DWORD	database;	 
	DWORD	winsect;	 
	BYTE	win[512]; 
} FATFS;



 

typedef struct _DIR_ {
	FATFS*	fs;			 
	WORD	id;			 
	WORD	index;		 
	DWORD	sclust;		 
	DWORD	clust;		 
	DWORD	sect;		 
	BYTE*	dir;		 
	BYTE*	fn;			 




} DIR;



 

typedef struct _FIL_ {
	FATFS*	fs;			 
	WORD	id;			 
	BYTE	flag;		 
	BYTE	csect;		 
	DWORD	fptr;		 
	DWORD	fsize;		 
	DWORD	org_clust;	 
	DWORD	curr_clust;	 
	DWORD	dsect;		 

	DWORD	dir_sect;	 
	BYTE*	dir_ptr;	 


	BYTE	buf[512]; 

} FIL;



 

typedef struct _FILINFO_ {
	DWORD	fsize;		 
	WORD	fdate;		 
	WORD	ftime;		 
	BYTE	fattrib;	 
	char	fname[13];	 




} FILINFO;



 

typedef enum {
	FR_OK = 0,			 
	FR_DISK_ERR,		 
	FR_INT_ERR,			 
	FR_NOT_READY,		 
	FR_NO_FILE,			 
	FR_NO_PATH,			 
	FR_INVALID_NAME,	 
	FR_DENIED,			 
	FR_EXIST,			 
	FR_INVALID_OBJECT,	 
	FR_WRITE_PROTECTED,	 
	FR_INVALID_DRIVE,	 
	FR_NOT_ENABLED,		 
	FR_NO_FILESYSTEM,	 
	FR_MKFS_ABORTED,	 
	FR_TIMEOUT			 
} FRESULT;



 
 

FRESULT f_mount (BYTE, FATFS*);						 
FRESULT f_open (FIL*, const XCHAR*, BYTE);			 
FRESULT f_read (FIL*, void*, UINT, UINT*);			 
FRESULT f_write (FIL*, const void*, UINT, UINT*);	 
FRESULT f_lseek (FIL*, DWORD);						 
FRESULT f_close (FIL*);								 
FRESULT f_opendir (DIR*, const XCHAR*);				 
FRESULT f_readdir (DIR*, FILINFO*);					 
FRESULT f_stat (const XCHAR*, FILINFO*);			 
FRESULT f_getfree (const XCHAR*, DWORD*, FATFS**);	 
FRESULT f_truncate (FIL*);							 
FRESULT f_sync (FIL*);								 
FRESULT f_unlink (const XCHAR*);					 
FRESULT	f_mkdir (const XCHAR*);						 
FRESULT f_chmod (const XCHAR*, BYTE, BYTE);			 
FRESULT f_utime (const XCHAR*, const FILINFO*);		 
FRESULT f_rename (const XCHAR*, const XCHAR*);		 
FRESULT f_forward (FIL*, UINT(*)(const BYTE*,UINT), UINT, UINT*);	 
FRESULT f_mkfs (BYTE, BYTE, WORD);					 
FRESULT f_chdir (const XCHAR*);						 
FRESULT f_chdrive (BYTE);							 

#line 451 "fatfs\\ff.h"



 
 

 

DWORD get_fattime (void);	 
							 


 





 
#line 476 "fatfs\\ff.h"



 
 


 

#line 496 "fatfs\\ff.h"


 






 

#line 515 "fatfs\\ff.h"




 

#line 536 "fatfs\\ff.h"







#line 554 "fatfs\\ff.h"








#line 577 "fatfs\\ff.h"



 
 

#line 594 "fatfs\\ff.h"


#line 80 "fatfs\\ff.c"
#line 1 "fatfs\\diskio.h"


 






#line 11 "fatfs\\diskio.h"


 
typedef BYTE	DSTATUS;

 
typedef enum {
	RES_OK = 0,		 
	RES_ERROR,		 
	RES_WRPRT,		 
	RES_NOTRDY,		 
	RES_PARERR		 
} DRESULT;


 
 

BOOL assign_drives (int argc, char *argv[]);
DSTATUS disk_initialize (BYTE);
DSTATUS disk_status (BYTE);
DRESULT disk_read (BYTE, BYTE*, DWORD, BYTE);

DRESULT disk_write (BYTE, const BYTE*, DWORD, BYTE);

DRESULT disk_ioctl (BYTE, BYTE, void*);



 
#line 49 "fatfs\\diskio.h"


 

 
#line 61 "fatfs\\diskio.h"
 





 





#line 81 "fatfs\\ff.c"





 





#line 102 "fatfs\\ff.c"









 
#line 119 "fatfs\\ff.c"








 




static
FATFS *FatFs[1];	 

static
WORD Fsid;				 







#line 157 "fatfs\\ff.c"










 


 
 
 

 
static
void mem_cpy (void* dst, const void* src, int cnt) {
	char *d = (char*)dst;
	const char *s = (const char *)src;
	while (cnt--) *d++ = *s++;
}

 
static
void mem_set (void* dst, int val, int cnt) {
	char *d = (char*)dst;
	while (cnt--) *d++ = (char)val;
}

 
static
int mem_cmp (const void* dst, const void* src, int cnt) {
	const char *d = (const char *)dst, *s = (const char *)src;
	int r = 0;
	while (cnt-- && (r = *d++ - *s++) == 0) ;
	return r;
}

 
static
int chk_chr (const char* str, int chr) {
	while (*str && *str != chr) str++;
	return *str;
}



 
 
 
#line 235 "fatfs\\ff.c"



 
 
 

static
FRESULT move_window (
	FATFS *fs,		 
	DWORD sector	 
)					 
{
	DWORD wsect;


	wsect = fs->winsect;
	if (wsect != sector) {	 

		if (fs->wflag) {	 
			if (disk_write(fs->drive, fs->win, wsect, 1) != RES_OK)
				return FR_DISK_ERR;
			fs->wflag = 0;
			if (wsect < (fs->fatbase + fs->sects_fat)) {	 
				BYTE nf;
				for (nf = fs->n_fats; nf > 1; nf--) {	 
					wsect += fs->sects_fat;
					disk_write(fs->drive, fs->win, wsect, 1);
				}
			}
		}

		if (sector) {
			if (disk_read(fs->drive, fs->win, sector, 1) != RES_OK)
				return FR_DISK_ERR;
			fs->winsect = sector;
		}
	}

	return FR_OK;
}




 
 
 

static
FRESULT sync (	 
	FATFS *fs	 
)
{
	FRESULT res;


	res = move_window(fs, 0);
	if (res == FR_OK) {
		 
		if (fs->fs_type == 3 && fs->fsi_flag) {
			fs->winsect = 0;
			mem_set(fs->win, 0, 512);
			*(BYTE*)(fs->win+510)=(BYTE)(0xAA55); *(BYTE*)((fs->win+510)+1)=(BYTE)((WORD)(0xAA55)>>8);
			*(BYTE*)(fs->win+0)=(BYTE)(0x41615252); *(BYTE*)((fs->win+0)+1)=(BYTE)((WORD)(0x41615252)>>8); *(BYTE*)((fs->win+0)+2)=(BYTE)((DWORD)(0x41615252)>>16); *(BYTE*)((fs->win+0)+3)=(BYTE)((DWORD)(0x41615252)>>24);
			*(BYTE*)(fs->win+484)=(BYTE)(0x61417272); *(BYTE*)((fs->win+484)+1)=(BYTE)((WORD)(0x61417272)>>8); *(BYTE*)((fs->win+484)+2)=(BYTE)((DWORD)(0x61417272)>>16); *(BYTE*)((fs->win+484)+3)=(BYTE)((DWORD)(0x61417272)>>24);
			*(BYTE*)(fs->win+488)=(BYTE)(fs->free_clust); *(BYTE*)((fs->win+488)+1)=(BYTE)((WORD)(fs->free_clust)>>8); *(BYTE*)((fs->win+488)+2)=(BYTE)((DWORD)(fs->free_clust)>>16); *(BYTE*)((fs->win+488)+3)=(BYTE)((DWORD)(fs->free_clust)>>24);
			*(BYTE*)(fs->win+492)=(BYTE)(fs->last_clust); *(BYTE*)((fs->win+492)+1)=(BYTE)((WORD)(fs->last_clust)>>8); *(BYTE*)((fs->win+492)+2)=(BYTE)((DWORD)(fs->last_clust)>>16); *(BYTE*)((fs->win+492)+3)=(BYTE)((DWORD)(fs->last_clust)>>24);
			disk_write(fs->drive, fs->win, fs->fsi_sector, 1);
			fs->fsi_flag = 0;
		}
		 
		if (disk_ioctl(fs->drive, 0, (void*)0) != RES_OK)
			res = FR_DISK_ERR;
	}

	return res;
}





 
 
 


DWORD get_fat (	 
	FATFS *fs,	 
	DWORD clst	 
)
{
	UINT wc, bc;
	DWORD fsect;


	if (clst < 2 || clst >= fs->max_clust)	 
		return 1;

	fsect = fs->fatbase;
	switch (fs->fs_type) {
	case 1 :
		bc = clst; bc += bc / 2;
		if (move_window(fs, fsect + (bc / 512U))) break;
		wc = fs->win[bc & (512U - 1)]; bc++;
		if (move_window(fs, fsect + (bc / 512U))) break;
		wc |= (WORD)fs->win[bc & (512U - 1)] << 8;
		return (clst & 1) ? (wc >> 4) : (wc & 0xFFF);

	case 2 :
		if (move_window(fs, fsect + (clst / (512U / 2)))) break;
		return (WORD)(((WORD)*(BYTE*)((&fs->win[((WORD)clst * 2) & (512U - 1)])+1)<<8)|(WORD)*(BYTE*)(&fs->win[((WORD)clst * 2) & (512U - 1)]));

	case 3 :
		if (move_window(fs, fsect + (clst / (512U / 4)))) break;
		return (DWORD)(((DWORD)*(BYTE*)((&fs->win[((WORD)clst * 4) & (512U - 1)])+3)<<24)|((DWORD)*(BYTE*)((&fs->win[((WORD)clst * 4) & (512U - 1)])+2)<<16)|((WORD)*(BYTE*)((&fs->win[((WORD)clst * 4) & (512U - 1)])+1)<<8)| *(BYTE*)(&fs->win[((WORD)clst * 4) & (512U - 1)])) & 0x0FFFFFFF;
	}

	return 0xFFFFFFFF;	 
}




 
 
 


FRESULT put_fat (
	FATFS *fs,	 
	DWORD clst,	 
	DWORD val	 
)
{
	UINT bc;
	BYTE *p;
	DWORD fsect;
	FRESULT res;


	if (clst < 2 || clst >= fs->max_clust) {	 
		res = FR_INT_ERR;

	} else {
		fsect = fs->fatbase;
		switch (fs->fs_type) {
		case 1 :
			bc = clst; bc += bc / 2;
			res = move_window(fs, fsect + (bc / 512U));
			if (res != FR_OK) break;
			p = &fs->win[bc & (512U - 1)];
			*p = (clst & 1) ? ((*p & 0x0F) | ((BYTE)val << 4)) : (BYTE)val;
			bc++;
			fs->wflag = 1;
			res = move_window(fs, fsect + (bc / 512U));
			if (res != FR_OK) break;
			p = &fs->win[bc & (512U - 1)];
			*p = (clst & 1) ? (BYTE)(val >> 4) : ((*p & 0xF0) | ((BYTE)(val >> 8) & 0x0F));
			break;

		case 2 :
			res = move_window(fs, fsect + (clst / (512U / 2)));
			if (res != FR_OK) break;
			*(BYTE*)(&fs->win[((WORD)clst * 2) & (512U - 1)])=(BYTE)((WORD)val); *(BYTE*)((&fs->win[((WORD)clst * 2) & (512U - 1)])+1)=(BYTE)((WORD)((WORD)val)>>8);
			break;

		case 3 :
			res = move_window(fs, fsect + (clst / (512U / 4)));
			if (res != FR_OK) break;
			*(BYTE*)(&fs->win[((WORD)clst * 4) & (512U - 1)])=(BYTE)(val); *(BYTE*)((&fs->win[((WORD)clst * 4) & (512U - 1)])+1)=(BYTE)((WORD)(val)>>8); *(BYTE*)((&fs->win[((WORD)clst * 4) & (512U - 1)])+2)=(BYTE)((DWORD)(val)>>16); *(BYTE*)((&fs->win[((WORD)clst * 4) & (512U - 1)])+3)=(BYTE)((DWORD)(val)>>24);
			break;

		default :
			res = FR_INT_ERR;
		}
		fs->wflag = 1;
	}

	return res;
}





 
 
 

static
FRESULT remove_chain (
	FATFS *fs,			 
	DWORD clst			 
)
{
	FRESULT res;
	DWORD nxt;


	if (clst < 2 || clst >= fs->max_clust) {	 
		res = FR_INT_ERR;

	} else {
		res = FR_OK;
		while (clst < fs->max_clust) {			 
			nxt = get_fat(fs, clst);			 
			if (nxt == 0) break;				 
			if (nxt == 1) { res = FR_INT_ERR; break; }	 
			if (nxt == 0xFFFFFFFF) { res = FR_DISK_ERR; break; }	 
			res = put_fat(fs, clst, 0);			 
			if (res != FR_OK) break;
			if (fs->free_clust != 0xFFFFFFFF) {	 
				fs->free_clust++;
				fs->fsi_flag = 1;
			}
			clst = nxt;	 
		}
	}

	return res;
}





 
 
 

static
DWORD create_chain (	 
	FATFS *fs,			 
	DWORD clst			 
)
{
	DWORD cs, ncl, scl, mcl;


	mcl = fs->max_clust;
	if (clst == 0) {		 
		scl = fs->last_clust;			 
		if (scl == 0 || scl >= mcl) scl = 1;
	}
	else {					 
		cs = get_fat(fs, clst);			 
		if (cs < 2) return 1;			 
		if (cs < mcl) return cs;		 
		scl = clst;
	}

	ncl = scl;				 
	for (;;) {
		ncl++;							 
		if (ncl >= mcl) {				 
			ncl = 2;
			if (ncl > scl) return 0;	 
		}
		cs = get_fat(fs, ncl);			 
		if (cs == 0) break;				 
		if (cs == 0xFFFFFFFF || cs == 1) 
			return cs;
		if (ncl == scl) return 0;		 
	}

	if (put_fat(fs, ncl, 0x0FFFFFFF))	 
		return 0xFFFFFFFF;
	if (clst != 0) {					 
		if (put_fat(fs, clst, ncl))
			return 0xFFFFFFFF;
	}

	fs->last_clust = ncl;				 
	if (fs->free_clust != 0xFFFFFFFF) {
		fs->free_clust--;
		fs->fsi_flag = 1;
	}

	return ncl;		 
}





 
 
 


DWORD clust2sect (	 
	FATFS *fs,		 
	DWORD clst		 
)
{
	clst -= 2;
	if (clst >= (fs->max_clust - 2)) return 0;		 
	return clst * fs->csize + fs->database;
}




 
 
 

static
FRESULT dir_seek (
	DIR *dj,		 
	WORD idx		 
)
{
	DWORD clst;
	WORD ic;


	dj->index = idx;
	clst = dj->sclust;
	if (clst == 1 || clst >= dj->fs->max_clust)	 
		return FR_INT_ERR;
	if (!clst && dj->fs->fs_type == 3)	 
		clst = dj->fs->dirbase;

	if (clst == 0) {	 
		dj->clust = clst;
		if (idx >= dj->fs->n_rootdir)		 
			return FR_INT_ERR;
		dj->sect = dj->fs->dirbase + idx / (512U / 32);	 
	}
	else {				 
		ic = 512U / 32 * dj->fs->csize;	 
		while (idx >= ic) {	 
			clst = get_fat(dj->fs, clst);				 
			if (clst == 0xFFFFFFFF) return FR_DISK_ERR;	 
			if (clst < 2 || clst >= dj->fs->max_clust)	 
				return FR_INT_ERR;
			idx -= ic;
		}
		dj->clust = clst;
		dj->sect = clust2sect(dj->fs, clst) + idx / (512U / 32);	 
	}

	dj->dir = dj->fs->win + (idx % (512U / 32)) * 32;	 

	return FR_OK;	 
}




 
 
 

static
FRESULT dir_next (	 
	DIR *dj,		 
	BOOL streach	 
)
{
	DWORD clst;
	WORD i;


	i = dj->index + 1;
	if (!i || !dj->sect)	 
		return FR_NO_FILE;

	if (!(i % (512U / 32))) {	 
		dj->sect++;					 

		if (dj->clust == 0) {	 
			if (i >= dj->fs->n_rootdir)	 
				return FR_NO_FILE;
		}
		else {					 
			if (((i / (512U / 32)) & (dj->fs->csize - 1)) == 0) {	 
				clst = get_fat(dj->fs, dj->clust);				 
				if (clst <= 1) return FR_INT_ERR;
				if (clst == 0xFFFFFFFF) return FR_DISK_ERR;
				if (clst >= dj->fs->max_clust) {				 

					BYTE c;
					if (!streach) return FR_NO_FILE;			 
					clst = create_chain(dj->fs, dj->clust);		 
					if (clst == 0) return FR_DENIED;			 
					if (clst == 1) return FR_INT_ERR;
					if (clst == 0xFFFFFFFF) return FR_DISK_ERR;
					 
					if (move_window(dj->fs, 0)) return FR_DISK_ERR;	 
					mem_set(dj->fs->win, 0, 512U);			 
					dj->fs->winsect = clust2sect(dj->fs, clst);	 
					for (c = 0; c < dj->fs->csize; c++) {		 
						dj->fs->wflag = 1;
						if (move_window(dj->fs, 0)) return FR_DISK_ERR;
						dj->fs->winsect++;
					}
					dj->fs->winsect -= c;						 



				}
				dj->clust = clst;				 
				dj->sect = clust2sect(dj->fs, clst);
			}
		}
	}

	dj->index = i;
	dj->dir = dj->fs->win + (i % (512U / 32)) * 32;

	return FR_OK;
}




 
 
 
#line 757 "fatfs\\ff.c"



 
 
 
#line 801 "fatfs\\ff.c"




 
 
 
#line 821 "fatfs\\ff.c"




 
 
 

static
FRESULT dir_find (
	DIR *dj			 
)
{
	FRESULT res;
	BYTE c, *dir;




	res = dir_seek(dj, 0);			 
	if (res != FR_OK) return res;




	do {
		res = move_window(dj->fs, dj->sect);
		if (res != FR_OK) break;
		dir = dj->dir;					 
		c = dir[0];
		if (c == 0) { res = FR_NO_FILE; break; }	 
#line 874 "fatfs\\ff.c"
		if (!(dir[11] & 0x08) && !mem_cmp(dir, dj->fn, 11))  
			break;

		res = dir_next(dj, FALSE);		 
	} while (res == FR_OK);

	return res;
}




 
 
 

static
FRESULT dir_read (
	DIR *dj			 
)
{
	FRESULT res;
	BYTE c, *dir;




	res = FR_NO_FILE;
	while (dj->sect) {
		res = move_window(dj->fs, dj->sect);
		if (res != FR_OK) break;
		dir = dj->dir;					 
		c = dir[0];
		if (c == 0) { res = FR_NO_FILE; break; }	 
#line 928 "fatfs\\ff.c"
		if (c != 0xE5 && (0 || c != '.') && !(dir[11] & 0x08))	 
			break;

		res = dir_next(dj, FALSE);				 
		if (res != FR_OK) break;
	}

	if (res != FR_OK) dj->sect = 0;

	return res;
}




 
 
 

static
FRESULT dir_register (	 
	DIR *dj				 
)
{
	FRESULT res;
	BYTE c, *dir;
#line 1017 "fatfs\\ff.c"
	res = dir_seek(dj, 0);
	if (res == FR_OK) {
		do {	 
			res = move_window(dj->fs, dj->sect);
			if (res != FR_OK) break;
			c = *dj->dir;
			if (c == 0xE5 || c == 0) break;	 
			res = dir_next(dj, TRUE);		 
		} while (res == FR_OK);
	}


	if (res == FR_OK) {		 
		res = move_window(dj->fs, dj->sect);
		if (res == FR_OK) {
			dir = dj->dir;
			mem_set(dir, 0, 32);		 
			mem_cpy(dir, dj->fn, 11);	 
			dir[12] = *(dj->fn+11) & (0x08 | 0x10);	 
			dj->fs->wflag = 1;
		}
	}

	return res;
}





 
 
 

static
FRESULT dir_remove (	 
	DIR *dj				 
)
{
	FRESULT res;
#line 1075 "fatfs\\ff.c"
	res = dir_seek(dj, dj->index);
	if (res == FR_OK) {
		res = move_window(dj->fs, dj->sect);
		if (res == FR_OK) {
			*dj->dir = 0xE5;			 
			dj->fs->wflag = 1;
		}
	}


	return res;
}





 
 
 

static
FRESULT create_name (
	DIR *dj,			 
	const XCHAR **path	 
)
{




#line 1228 "fatfs\\ff.c"
	BYTE b, c, d, *sfn;
	int ni, si, i;
	const char *p;

	 
	sfn = dj->fn;
	mem_set(sfn, ' ', 11);
	si = i = b = 0; ni = 8;
	p = *path;
#line 1250 "fatfs\\ff.c"
	for (;;) {
		c = p[si++];
		if (c <= ' ' || c == '/' || c == '\\') break;	 
		if (c == '.' || i >= ni) {
			if (ni != 8 || c != '.') return FR_INVALID_NAME;
			i = 8; ni = 11;
			b <<= 2; continue;
		}
		if (c >= 0x80) {				 



			b |= 3;						 




		}
		if ((((BYTE)(c) >= 0x81 && (BYTE)(c) <= 0x9F) || ((BYTE)(c) >= 0xE0 && (BYTE)(c) <= 0xFC))) {				 
			d = p[si++];				 
			if (!(((BYTE)(d) >= 0x40 && (BYTE)(d) <= 0x7E) || ((BYTE)(d) >= 0x80 && (BYTE)(d) <= 0xFC)) || i >= ni - 1)	 
				return FR_INVALID_NAME;
			sfn[i++] = c;
			sfn[i++] = d;
		} else {						 
			if (chk_chr(" \"*+,[=]|\x7F", c))	 
				return FR_INVALID_NAME;
			if ((((c)>= 'A')&&((c)<= 'Z'))) {			 
				b |= 2;
			} else {
				if ((((c)>= 'a')&&((c)<= 'z'))) {		 
					b |= 1; c -= 0x20;
				}
			}
			sfn[i++] = c;
		}
	}
	*path = &p[si];						 
	c = (c <= ' ') ? 0x04 : 0;		 

	if (!i) return FR_INVALID_NAME;		 
	if (sfn[0] == 0xE5) sfn[0] = 0x05;	 

	if (ni == 8) b <<= 2;
	if ((b & 0x03) == 0x01) c |= 0x10;	 
	if ((b & 0x0C) == 0x04) c |= 0x08;	 

	sfn[11] = c;		 

	return FR_OK;

}




 
 
 

static
void get_fileinfo (		 
	DIR *dj,			 
	FILINFO *fno	 	 
)
{
	int i;
	BYTE c, nt, *dir;
	char *p;


	p = fno->fname;
	if (dj->sect) {
		dir = dj->dir;
		nt = dir[12];		 
		for (i = 0; i < 8; i++) {	 
			c = dir[i];
			if (c == ' ') break;
			if (c == 0x05) c = 0xE5;
			if (0 && (nt & 0x08) && (((c)>= 'A')&&((c)<= 'Z'))) c += 0x20;
			*p++ = c;
		}
		if (dir[8] != ' ') {		 
			*p++ = '.';
			for (i = 8; i < 11; i++) {
				c = dir[i];
				if (c == ' ') break;
				if (0 && (nt & 0x10) && (((c)>= 'A')&&((c)<= 'Z'))) c += 0x20;
				*p++ = c;
			}
		}
		fno->fattrib = dir[11];				 
		fno->fsize = (DWORD)(((DWORD)*(BYTE*)((dir+28)+3)<<24)|((DWORD)*(BYTE*)((dir+28)+2)<<16)|((WORD)*(BYTE*)((dir+28)+1)<<8)| *(BYTE*)(dir+28));	 
		fno->fdate = (WORD)(((WORD)*(BYTE*)((dir+24)+1)<<8)|(WORD)*(BYTE*)(dir+24));		 
		fno->ftime = (WORD)(((WORD)*(BYTE*)((dir+22)+1)<<8)|(WORD)*(BYTE*)(dir+22));		 
	}
	*p = 0;

#line 1370 "fatfs\\ff.c"
}





 
 
 

static
FRESULT follow_path (	 
	DIR *dj,			 
	const XCHAR *path	 
)
{
	FRESULT res;
	BYTE *dir, last;


	while (!0 && *path == ' ') path++;	 
#line 1398 "fatfs\\ff.c"
	if (*path == '/' || *path == '\\')	 
		path++;
	dj->sclust = 0;						 


	if ((UINT)*path < ' ') {			 
		res = dir_seek(dj, 0);
		dj->dir = 0;

	} else {							 
		for (;;) {
			res = create_name(dj, &path);	 
			if (res != FR_OK) break;
			res = dir_find(dj);				 
			last = *(dj->fn+11) & 0x04;
			if (res != FR_OK) {				 
				if (res == FR_NO_FILE && !last)
					res = FR_NO_PATH;
				break;
			}
			if (last) break;				 
			dir = dj->dir;					 
			if (!(dir[11] & 0x10)) {  
				res = FR_NO_PATH; break;
			}
			dj->sclust = ((DWORD)(WORD)(((WORD)*(BYTE*)((dir+20)+1)<<8)|(WORD)*(BYTE*)(dir+20)) << 16) | (WORD)(((WORD)*(BYTE*)((dir+26)+1)<<8)|(WORD)*(BYTE*)(dir+26));
		}
	}

	return res;
}




 
 
 

static
BYTE check_fs (	 
	FATFS *fs,	 
	DWORD sect	 
)
{
	if (disk_read(fs->drive, fs->win, sect, 1) != RES_OK)	 
		return 3;
	if ((WORD)(((WORD)*(BYTE*)((&fs->win[510])+1)<<8)|(WORD)*(BYTE*)(&fs->win[510])) != 0xAA55)		 
		return 2;

	if (((DWORD)(((DWORD)*(BYTE*)((&fs->win[54])+3)<<24)|((DWORD)*(BYTE*)((&fs->win[54])+2)<<16)|((WORD)*(BYTE*)((&fs->win[54])+1)<<8)| *(BYTE*)(&fs->win[54])) & 0xFFFFFF) == 0x544146)	 
		return 0;
	if (((DWORD)(((DWORD)*(BYTE*)((&fs->win[82])+3)<<24)|((DWORD)*(BYTE*)((&fs->win[82])+2)<<16)|((WORD)*(BYTE*)((&fs->win[82])+1)<<8)| *(BYTE*)(&fs->win[82])) & 0xFFFFFF) == 0x544146)
		return 0;

	return 1;
}




 
 
 


FRESULT chk_mounted (	 
	const XCHAR **path,	 
	FATFS **rfs,		 
	BYTE chk_wp			 
)
{
	BYTE fmt, *tbl;
	UINT vol;
	DSTATUS stat;
	DWORD bsect, fsize, tsect, mclst;
	const XCHAR *p = *path;
	FATFS *fs;

	 
	vol = p[0] - '0';				 
	if (vol <= 9 && p[1] == ':') {	 
		p += 2; *path = p;			 
	} else {						 



		vol = 0;					 

	}

	 
	if (vol >= 1) 			 
		return FR_INVALID_DRIVE;
	*rfs = fs = FatFs[vol];			 
	if (!fs) return FR_NOT_ENABLED;	 

	;					 

	if (fs->fs_type) {				 
		stat = disk_status(fs->drive);
		if (!(stat & 0x01)) {	 

			if (chk_wp && (stat & 0x04))	 
				return FR_WRITE_PROTECTED;

			return FR_OK;			 
		}
	}

	 

	fs->fs_type = 0;					 
	fs->drive = (BYTE)(vol);		 
	stat = disk_initialize(fs->drive);	 
	if (stat & 0x01)				 
		return FR_NOT_READY;





	if (chk_wp && (stat & 0x04))	 
		return FR_WRITE_PROTECTED;

	 
	fmt = check_fs(fs, bsect = 0);		 
	if (fmt == 1) {						 
		 
		tbl = &fs->win[446 + 0 * 16];	 
		if (tbl[4]) {									 
			bsect = (DWORD)(((DWORD)*(BYTE*)((&tbl[8])+3)<<24)|((DWORD)*(BYTE*)((&tbl[8])+2)<<16)|((WORD)*(BYTE*)((&tbl[8])+1)<<8)| *(BYTE*)(&tbl[8]));					 
			fmt = check_fs(fs, bsect);					 
		}
	}
	if (fmt == 3) return FR_DISK_ERR;
	if (fmt || (WORD)(((WORD)*(BYTE*)((fs->win+11)+1)<<8)|(WORD)*(BYTE*)(fs->win+11)) != 512U)	 
		return FR_NO_FILESYSTEM;

	 
	fsize = (WORD)(((WORD)*(BYTE*)((fs->win+22)+1)<<8)|(WORD)*(BYTE*)(fs->win+22));				 
	if (!fsize) fsize = (DWORD)(((DWORD)*(BYTE*)((fs->win+36)+3)<<24)|((DWORD)*(BYTE*)((fs->win+36)+2)<<16)|((WORD)*(BYTE*)((fs->win+36)+1)<<8)| *(BYTE*)(fs->win+36));
	fs->sects_fat = fsize;
	fs->n_fats = fs->win[16];					 
	fsize *= fs->n_fats;								 
	fs->fatbase = bsect + (WORD)(((WORD)*(BYTE*)((fs->win+14)+1)<<8)|(WORD)*(BYTE*)(fs->win+14));  
	fs->csize = fs->win[13];				 
	fs->n_rootdir = (WORD)(((WORD)*(BYTE*)((fs->win+17)+1)<<8)|(WORD)*(BYTE*)(fs->win+17));	 
	tsect = (WORD)(((WORD)*(BYTE*)((fs->win+19)+1)<<8)|(WORD)*(BYTE*)(fs->win+19));				 
	if (!tsect) tsect = (DWORD)(((DWORD)*(BYTE*)((fs->win+32)+3)<<24)|((DWORD)*(BYTE*)((fs->win+32)+2)<<16)|((WORD)*(BYTE*)((fs->win+32)+1)<<8)| *(BYTE*)(fs->win+32));
	fs->max_clust = mclst = (tsect						 
		- (WORD)(((WORD)*(BYTE*)((fs->win+14)+1)<<8)|(WORD)*(BYTE*)(fs->win+14)) - fsize - fs->n_rootdir / (512U/32)
		) / fs->csize + 2;

	fmt = 1;										 
	if (mclst >= 0xFF7) fmt = 2;					 
	if (mclst >= 0xFFF7) fmt = 3;				 

	if (fmt == 3)
		fs->dirbase = (DWORD)(((DWORD)*(BYTE*)((fs->win+44)+3)<<24)|((DWORD)*(BYTE*)((fs->win+44)+2)<<16)|((WORD)*(BYTE*)((fs->win+44)+1)<<8)| *(BYTE*)(fs->win+44));	 
	else
		fs->dirbase = fs->fatbase + fsize;				 
	fs->database = fs->fatbase + fsize + fs->n_rootdir / (512U/32);	 


	 
	fs->free_clust = 0xFFFFFFFF;
	fs->wflag = 0;
	 
	if (fmt == 3) {
	 	fs->fsi_flag = 0;
		fs->fsi_sector = bsect + (WORD)(((WORD)*(BYTE*)((fs->win+48)+1)<<8)|(WORD)*(BYTE*)(fs->win+48));
		if (disk_read(fs->drive, fs->win, fs->fsi_sector, 1) == RES_OK &&
			(WORD)(((WORD)*(BYTE*)((fs->win+510)+1)<<8)|(WORD)*(BYTE*)(fs->win+510)) == 0xAA55 &&
			(DWORD)(((DWORD)*(BYTE*)((fs->win+0)+3)<<24)|((DWORD)*(BYTE*)((fs->win+0)+2)<<16)|((WORD)*(BYTE*)((fs->win+0)+1)<<8)| *(BYTE*)(fs->win+0)) == 0x41615252 &&
			(DWORD)(((DWORD)*(BYTE*)((fs->win+484)+3)<<24)|((DWORD)*(BYTE*)((fs->win+484)+2)<<16)|((WORD)*(BYTE*)((fs->win+484)+1)<<8)| *(BYTE*)(fs->win+484)) == 0x61417272) {
			fs->last_clust = (DWORD)(((DWORD)*(BYTE*)((fs->win+492)+3)<<24)|((DWORD)*(BYTE*)((fs->win+492)+2)<<16)|((WORD)*(BYTE*)((fs->win+492)+1)<<8)| *(BYTE*)(fs->win+492));
			fs->free_clust = (DWORD)(((DWORD)*(BYTE*)((fs->win+488)+3)<<24)|((DWORD)*(BYTE*)((fs->win+488)+2)<<16)|((WORD)*(BYTE*)((fs->win+488)+1)<<8)| *(BYTE*)(fs->win+488));
		}
	}

	fs->fs_type = fmt;		 
	fs->winsect = 0;		 



	fs->id = ++Fsid;		 

	return FR_OK;
}




 
 
 

static
FRESULT validate (	 
	FATFS *fs,		 
	WORD id			 
)
{
	if (!fs || !fs->fs_type || fs->id != id)
		return FR_INVALID_OBJECT;

	;		 

	if (disk_status(fs->drive) & 0x01)
		return FR_NOT_READY;

	return FR_OK;
}








 



 
 
 

FRESULT f_mount (
	BYTE vol,		 
	FATFS *fs		 
)
{
	FATFS *rfs;


	if (vol >= 1)				 
		return FR_INVALID_DRIVE;
	rfs = FatFs[vol];				 

	if (rfs) {



		rfs->fs_type = 0;			 
	}

	if (fs) {
		fs->fs_type = 0;			 



	}
	FatFs[vol] = fs;				 

	return FR_OK;
}




 
 
 

FRESULT f_open (
	FIL *fp,			 
	const XCHAR *path,	 
	BYTE mode			 
)
{
	FRESULT res;
	DIR dj;
	BYTE sfn[12];
	BYTE *dir;


	fp->fs = 0;		 

	mode &= (0x01 | 0x02 | 0x08 | 0x10 | 0x04);
	res = chk_mounted(&path, &dj.fs, (BYTE)(mode & (0x02 | 0x08 | 0x10 | 0x04)));




	if (res != FR_OK) return res;
	dj . fn = sfn;
	res = follow_path(&dj, path);	 


	 
	if (mode & (0x08 | 0x10 | 0x04)) {
		DWORD ps, cl;

		if (res != FR_OK) {			 
			if (res == FR_NO_FILE)	 
				res = dir_register(&dj);
			if (res != FR_OK) return res;
			mode |= 0x08;
			dir = dj.dir;			 
		}
		else {						 
			if (mode & 0x04)			 
				return FR_EXIST;
			dir = dj.dir;
			if (!dir || (dir[11] & (0x01 | 0x10)))	 
				return FR_DENIED;
			if (mode & 0x08) {		 
				cl = ((DWORD)(WORD)(((WORD)*(BYTE*)((dir+20)+1)<<8)|(WORD)*(BYTE*)(dir+20)) << 16) | (WORD)(((WORD)*(BYTE*)((dir+26)+1)<<8)|(WORD)*(BYTE*)(dir+26));	 
				*(BYTE*)(dir+20)=(BYTE)(0); *(BYTE*)((dir+20)+1)=(BYTE)((WORD)(0)>>8);	 
				*(BYTE*)(dir+26)=(BYTE)(0); *(BYTE*)((dir+26)+1)=(BYTE)((WORD)(0)>>8);
				*(BYTE*)(dir+28)=(BYTE)(0); *(BYTE*)((dir+28)+1)=(BYTE)((WORD)(0)>>8); *(BYTE*)((dir+28)+2)=(BYTE)((DWORD)(0)>>16); *(BYTE*)((dir+28)+3)=(BYTE)((DWORD)(0)>>24);	 
				dj.fs->wflag = 1;
				ps = dj.fs->winsect;			 
				if (cl) {
					res = remove_chain(dj.fs, cl);
					if (res) return res;
					dj.fs->last_clust = cl - 1;	 
				}
				res = move_window(dj.fs, ps);
				if (res != FR_OK) return res;
			}
		}
		if (mode & 0x08) {
			dir[11] = 0;					 
			ps = get_fattime();
			*(BYTE*)(dir+14)=(BYTE)(ps); *(BYTE*)((dir+14)+1)=(BYTE)((WORD)(ps)>>8); *(BYTE*)((dir+14)+2)=(BYTE)((DWORD)(ps)>>16); *(BYTE*)((dir+14)+3)=(BYTE)((DWORD)(ps)>>24);		 
			dj.fs->wflag = 1;
			mode |= 0x20;				 
		}
	}
	 
	else {

		if (res != FR_OK) return res;	 
		dir = dj.dir;
		if (!dir || (dir[11] & 0x10))	 
			return FR_NO_FILE;

		if ((mode & 0x02) && (dir[11] & 0x01))  
			return FR_DENIED;
	}
	fp->dir_sect = dj.fs->winsect;		 
	fp->dir_ptr = dj.dir;

	fp->flag = mode;					 
	fp->org_clust =						 
		((DWORD)(WORD)(((WORD)*(BYTE*)((dir+20)+1)<<8)|(WORD)*(BYTE*)(dir+20)) << 16) | (WORD)(((WORD)*(BYTE*)((dir+26)+1)<<8)|(WORD)*(BYTE*)(dir+26));
	fp->fsize = (DWORD)(((DWORD)*(BYTE*)((dir+28)+3)<<24)|((DWORD)*(BYTE*)((dir+28)+2)<<16)|((WORD)*(BYTE*)((dir+28)+1)<<8)| *(BYTE*)(dir+28));	 
	fp->fptr = 0; fp->csect = 255;		 
	fp->dsect = 0;
	fp->fs = dj.fs; fp->id = dj.fs->id;	 

	return FR_OK;
}




 
 
 

FRESULT f_read (
	FIL *fp, 		 
	void *buff,		 
	UINT btr,		 
	UINT *br		 
)
{
	FRESULT res;
	DWORD clst, sect, remain;
	UINT rcnt, cc;
	BYTE *rbuff = buff;


	*br = 0;	 

	res = validate(fp->fs, fp->id);					 
	if (res != FR_OK) return res;
	if (fp->flag & 0x80)						 
		return FR_INT_ERR;
	if (!(fp->flag & 0x01)) 						 
		return FR_DENIED;
	remain = fp->fsize - fp->fptr;
	if (btr > remain) btr = (UINT)remain;			 

	for ( ;  btr;									 
		rbuff += rcnt, fp->fptr += rcnt, *br += rcnt, btr -= rcnt) {
		if ((fp->fptr % 512U) == 0) {			 
			if (fp->csect >= fp->fs->csize) {		 
				clst = (fp->fptr == 0) ?			 
					fp->org_clust : get_fat(fp->fs, fp->curr_clust);
				if (clst <= 1) { fp->flag |= 0x80; return FR_INT_ERR; };
				if (clst == 0xFFFFFFFF) { fp->flag |= 0x80; return FR_DISK_ERR; };
				fp->curr_clust = clst;				 
				fp->csect = 0;						 
			}
			sect = clust2sect(fp->fs, fp->curr_clust);	 
			if (!sect) { fp->flag |= 0x80; return FR_INT_ERR; };
			sect += fp->csect;
			cc = btr / 512U;					 
			if (cc) {								 
				if (fp->csect + cc > fp->fs->csize)	 
					cc = fp->fs->csize - fp->csect;
				if (disk_read(fp->fs->drive, rbuff, sect, (BYTE)cc) != RES_OK)
					{ fp->flag |= 0x80; return FR_DISK_ERR; };





				if ((fp->flag & 0x40) && fp->dsect - sect < cc)	 
					mem_cpy(rbuff + ((fp->dsect - sect) * 512U), fp->buf, 512U);


				fp->csect += (BYTE)cc;				 
				rcnt = 512U * cc;				 
				continue;
			}


			if (fp->flag & 0x40) {			 
				if (disk_write(fp->fs->drive, fp->buf, fp->dsect, 1) != RES_OK)
					{ fp->flag |= 0x80; return FR_DISK_ERR; };
				fp->flag &= ~0x40;
			}

			if (fp->dsect != sect) {			 
				if (disk_read(fp->fs->drive, fp->buf, sect, 1) != RES_OK)
					{ fp->flag |= 0x80; return FR_DISK_ERR; };
			}

			fp->dsect = sect;
			fp->csect++;							 
		}
		rcnt = 512U - (fp->fptr % 512U);	 
		if (rcnt > btr) rcnt = btr;





		mem_cpy(rbuff, &fp->buf[fp->fptr % 512U], rcnt);	 

	}

	return FR_OK;
}





 
 
 

FRESULT f_write (
	FIL *fp,			 
	const void *buff,	 
	UINT btw,			 
	UINT *bw			 
)
{
	FRESULT res;
	DWORD clst, sect;
	UINT wcnt, cc;
	const BYTE *wbuff = buff;


	*bw = 0;	 

	res = validate(fp->fs, fp->id);					 
	if (res != FR_OK) return res;
	if (fp->flag & 0x80)						 
		return FR_INT_ERR;
	if (!(fp->flag & 0x02))						 
		return FR_DENIED;
	if (fp->fsize + btw < fp->fsize) btw = 0;		 

	for ( ;  btw;									 
		wbuff += wcnt, fp->fptr += wcnt, *bw += wcnt, btw -= wcnt) {
		if ((fp->fptr % 512U) == 0) {			 
			if (fp->csect >= fp->fs->csize) {		 
				if (fp->fptr == 0) {				 
					clst = fp->org_clust;			 
					if (clst == 0)					 
						fp->org_clust = clst = create_chain(fp->fs, 0);	 
				} else {							 
					clst = create_chain(fp->fs, fp->curr_clust);			 
				}
				if (clst == 0) break;				 
				if (clst == 1) { fp->flag |= 0x80; return FR_INT_ERR; };
				if (clst == 0xFFFFFFFF) { fp->flag |= 0x80; return FR_DISK_ERR; };
				fp->curr_clust = clst;				 
				fp->csect = 0;						 
			}




			if (fp->flag & 0x40) {		 
				if (disk_write(fp->fs->drive, fp->buf, fp->dsect, 1) != RES_OK)
					{ fp->flag |= 0x80; return FR_DISK_ERR; };
				fp->flag &= ~0x40;
			}

			sect = clust2sect(fp->fs, fp->curr_clust);	 
			if (!sect) { fp->flag |= 0x80; return FR_INT_ERR; };
			sect += fp->csect;
			cc = btw / 512U;					 
			if (cc) {								 
				if (fp->csect + cc > fp->fs->csize)	 
					cc = fp->fs->csize - fp->csect;
				if (disk_write(fp->fs->drive, wbuff, sect, (BYTE)cc) != RES_OK)
					{ fp->flag |= 0x80; return FR_DISK_ERR; };
#line 1923 "fatfs\\ff.c"
				if (fp->dsect - sect < cc) {		 
					mem_cpy(fp->buf, wbuff + ((fp->dsect - sect) * 512U), 512U);
					fp->flag &= ~0x40;
				}

				fp->csect += (BYTE)cc;				 
				wcnt = 512U * cc;				 
				continue;
			}
#line 1938 "fatfs\\ff.c"
			if (fp->dsect != sect) {				 
				if (fp->fptr < fp->fsize &&
					disk_read(fp->fs->drive, fp->buf, sect, 1) != RES_OK)
						{ fp->flag |= 0x80; return FR_DISK_ERR; };
			}

			fp->dsect = sect;
			fp->csect++;							 
		}
		wcnt = 512U - (fp->fptr % 512U);	 
		if (wcnt > btw) wcnt = btw;
#line 1955 "fatfs\\ff.c"
		mem_cpy(&fp->buf[fp->fptr % 512U], wbuff, wcnt);	 
		fp->flag |= 0x40;

	}

	if (fp->fptr > fp->fsize) fp->fsize = fp->fptr;	 
	fp->flag |= 0x20;						 

	return FR_OK;
}




 
 
 

FRESULT f_sync (
	FIL *fp		 
)
{
	FRESULT res;
	DWORD tim;
	BYTE *dir;


	res = validate(fp->fs, fp->id);		 
	if (res == FR_OK) {
		if (fp->flag & 0x20) {	 

			if (fp->flag & 0x40) {
				if (disk_write(fp->fs->drive, fp->buf, fp->dsect, 1) != RES_OK)
					return FR_DISK_ERR;
				fp->flag &= ~0x40;
			}

			 
			res = move_window(fp->fs, fp->dir_sect);
			if (res == FR_OK) {
				dir = fp->dir_ptr;
				dir[11] |= 0x20;					 
				*(BYTE*)(dir+28)=(BYTE)(fp->fsize); *(BYTE*)((dir+28)+1)=(BYTE)((WORD)(fp->fsize)>>8); *(BYTE*)((dir+28)+2)=(BYTE)((DWORD)(fp->fsize)>>16); *(BYTE*)((dir+28)+3)=(BYTE)((DWORD)(fp->fsize)>>24);		 
				*(BYTE*)(dir+26)=(BYTE)(fp->org_clust); *(BYTE*)((dir+26)+1)=(BYTE)((WORD)(fp->org_clust)>>8);	 
				*(BYTE*)(dir+20)=(BYTE)(fp->org_clust >> 16); *(BYTE*)((dir+20)+1)=(BYTE)((WORD)(fp->org_clust >> 16)>>8);
				tim = get_fattime();			 
				*(BYTE*)(dir+22)=(BYTE)(tim); *(BYTE*)((dir+22)+1)=(BYTE)((WORD)(tim)>>8); *(BYTE*)((dir+22)+2)=(BYTE)((DWORD)(tim)>>16); *(BYTE*)((dir+22)+3)=(BYTE)((DWORD)(tim)>>24);
				fp->flag &= ~0x20;
				fp->fs->wflag = 1;
				res = sync(fp->fs);
			}
		}
	}

	return res;
}






 
 
 

FRESULT f_close (
	FIL *fp		 
)
{
	FRESULT res;







	res = f_sync(fp);
	if (res == FR_OK) fp->fs = 0;
	return res;

}




 
 
 

#line 2094 "fatfs\\ff.c"




 
 
 

FRESULT f_lseek (
	FIL *fp,		 
	DWORD ofs		 
)
{
	FRESULT res;
	DWORD clst, bcs, nsect, ifptr;


	res = validate(fp->fs, fp->id);		 
	if (res != FR_OK) return res;
	if (fp->flag & 0x80)			 
		return FR_INT_ERR;
	if (ofs > fp->fsize					 

		 && !(fp->flag & 0x02)

		) ofs = fp->fsize;

	ifptr = fp->fptr;
	fp->fptr = nsect = 0; fp->csect = 255;
	if (ofs > 0) {
		bcs = (DWORD)fp->fs->csize * 512U;	 
		if (ifptr > 0 &&
			(ofs - 1) / bcs >= (ifptr - 1) / bcs) {	 
			fp->fptr = (ifptr - 1) & ~(bcs - 1);	 
			ofs -= fp->fptr;
			clst = fp->curr_clust;
		} else {									 
			clst = fp->org_clust;					 

			if (clst == 0) {						 
				clst = create_chain(fp->fs, 0);
				if (clst == 1) { fp->flag |= 0x80; return FR_INT_ERR; };
				if (clst == 0xFFFFFFFF) { fp->flag |= 0x80; return FR_DISK_ERR; };
				fp->org_clust = clst;
			}

			fp->curr_clust = clst;
		}
		if (clst != 0) {
			while (ofs > bcs) {						 

				if (fp->flag & 0x02) {			 
					clst = create_chain(fp->fs, clst);	 
					if (clst == 0) {				 
						ofs = bcs; break;
					}
				} else

					clst = get_fat(fp->fs, clst);	 
				if (clst == 0xFFFFFFFF) { fp->flag |= 0x80; return FR_DISK_ERR; };
				if (clst <= 1 || clst >= fp->fs->max_clust) { fp->flag |= 0x80; return FR_INT_ERR; };
				fp->curr_clust = clst;
				fp->fptr += bcs;
				ofs -= bcs;
			}
			fp->fptr += ofs;
			fp->csect = (BYTE)(ofs / 512U);	 
			if (ofs % 512U) {
				nsect = clust2sect(fp->fs, clst);	 
				if (!nsect) { fp->flag |= 0x80; return FR_INT_ERR; };
				nsect += fp->csect;
				fp->csect++;
			}
		}
	}
	if (fp->fptr % 512U && nsect != fp->dsect) {


		if (fp->flag & 0x40) {			 
			if (disk_write(fp->fs->drive, fp->buf, fp->dsect, 1) != RES_OK)
				{ fp->flag |= 0x80; return FR_DISK_ERR; };
			fp->flag &= ~0x40;
		}

		if (disk_read(fp->fs->drive, fp->buf, nsect, 1) != RES_OK)
			{ fp->flag |= 0x80; return FR_DISK_ERR; };

		fp->dsect = nsect;
	}

	if (fp->fptr > fp->fsize) {			 
		fp->fsize = fp->fptr;
		fp->flag |= 0x20;
	}


	return res;
}





 
 
 

FRESULT f_opendir (
	DIR *dj,			 
	const XCHAR *path	 
)
{
	FRESULT res;
	BYTE sfn[12];
	BYTE *dir;


	res = chk_mounted(&path, &dj->fs, 0);
	if (res == FR_OK) {
		(*dj). fn = sfn;
		res = follow_path(dj, path);			 
		if (res == FR_OK) {						 
			dir = dj->dir;
			if (dir) {							 
				if (dir[11] & 0x10) {	 
					dj->sclust = ((DWORD)(WORD)(((WORD)*(BYTE*)((dir+20)+1)<<8)|(WORD)*(BYTE*)(dir+20)) << 16) | (WORD)(((WORD)*(BYTE*)((dir+26)+1)<<8)|(WORD)*(BYTE*)(dir+26));
				} else {						 
					res = FR_NO_PATH;
				}
			}
			if (res == FR_OK) {
				dj->id = dj->fs->id;
				res = dir_seek(dj, 0);			 
			}
		}
		if (res == FR_NO_FILE) res = FR_NO_PATH;
	}

	return res;
}




 
 
 

FRESULT f_readdir (
	DIR *dj,			 
	FILINFO *fno		 
)
{
	FRESULT res;
	BYTE sfn[12];


	res = validate(dj->fs, dj->id);			 
	if (res == FR_OK) {
		(*dj). fn = sfn;
		if (!fno) {
			res = dir_seek(dj, 0);
		} else {
			res = dir_read(dj);
			if (res == FR_NO_FILE) {
				dj->sect = 0;
				res = FR_OK;
			}
			if (res == FR_OK) {				 
				get_fileinfo(dj, fno);		 
				res = dir_next(dj, FALSE);	 
				if (res == FR_NO_FILE) {
					dj->sect = 0;
					res = FR_OK;
				}
			}
		}
	}

	return res;
}




 
 
 

FRESULT f_stat (
	const XCHAR *path,	 
	FILINFO *fno		 
)
{
	FRESULT res;
	DIR dj;
	BYTE sfn[12];


	res = chk_mounted(&path, &dj.fs, 0);
	if (res == FR_OK) {
		dj . fn = sfn;
		res = follow_path(&dj, path);	 
		if (res == FR_OK) {				 
			if (dj.dir)	 
				get_fileinfo(&dj, fno);
			else		 
				res = FR_INVALID_NAME;
		}
	}

	return res;
}




 
 
 

FRESULT f_getfree (
	const XCHAR *path,	 
	DWORD *nclst,		 
	FATFS **fatfs		 
)
{
	FRESULT res;
	DWORD n, clst, sect, stat;
	UINT i;
	BYTE fat, *p;


	 
	res = chk_mounted(&path, fatfs, 0);
	if (res != FR_OK) return res;

	 
	if ((*fatfs)->free_clust <= (*fatfs)->max_clust - 2) {
		*nclst = (*fatfs)->free_clust;
		return FR_OK;
	}

	 
	fat = (*fatfs)->fs_type;
	n = 0;
	if (fat == 1) {
		clst = 2;
		do {
			stat = get_fat(*fatfs, clst);
			if (stat == 0xFFFFFFFF) return FR_DISK_ERR;
			if (stat == 1) return FR_INT_ERR;
			if (stat == 0) n++;
		} while (++clst < (*fatfs)->max_clust);
	} else {
		clst = (*fatfs)->max_clust;
		sect = (*fatfs)->fatbase;
		i = 0; p = 0;
		do {
			if (!i) {
				res = move_window(*fatfs, sect++);
				if (res != FR_OK)
					return res;
				p = (*fatfs)->win;
				i = 512U;
			}
			if (fat == 2) {
				if ((WORD)(((WORD)*(BYTE*)((p)+1)<<8)|(WORD)*(BYTE*)(p)) == 0) n++;
				p += 2; i -= 2;
			} else {
				if (((DWORD)(((DWORD)*(BYTE*)((p)+3)<<24)|((DWORD)*(BYTE*)((p)+2)<<16)|((WORD)*(BYTE*)((p)+1)<<8)| *(BYTE*)(p)) & 0x0FFFFFFF) == 0) n++;
				p += 4; i -= 4;
			}
		} while (--clst);
	}
	(*fatfs)->free_clust = n;
	if (fat == 3) (*fatfs)->fsi_flag = 1;
	*nclst = n;

	return FR_OK;
}




 
 
 

FRESULT f_truncate (
	FIL *fp		 
)
{
	FRESULT res;
	DWORD ncl;


	res = validate(fp->fs, fp->id);		 
	if (res != FR_OK) return res;
	if (fp->flag & 0x80)			 
		return FR_INT_ERR;
	if (!(fp->flag & 0x02))			 
		return FR_DENIED;

	if (fp->fsize > fp->fptr) {
		fp->fsize = fp->fptr;	 
		fp->flag |= 0x20;
		if (fp->fptr == 0) {	 
			res = remove_chain(fp->fs, fp->org_clust);
			fp->org_clust = 0;
		} else {				 
			ncl = get_fat(fp->fs, fp->curr_clust);
			res = FR_OK;
			if (ncl == 0xFFFFFFFF) res = FR_DISK_ERR;
			if (ncl == 1) res = FR_INT_ERR;
			if (res == FR_OK && ncl < fp->fs->max_clust) {
				res = put_fat(fp->fs, fp->curr_clust, 0x0FFFFFFF);
				if (res == FR_OK) res = remove_chain(fp->fs, ncl);
			}
		}
	}
	if (res != FR_OK) fp->flag |= 0x80;

	return res;
}




 
 
 

FRESULT f_unlink (
	const XCHAR *path		 
)
{
	FRESULT res;
	DIR dj, sdj;
	BYTE sfn[12];
	BYTE *dir;
	DWORD dclst;


	res = chk_mounted(&path, &dj.fs, 1);
	if (res != FR_OK) return res;

	dj . fn = sfn;
	res = follow_path(&dj, path);			 
	if (0 && res == FR_OK && (dj.fn[11] & 0x20))
		res = FR_INVALID_NAME;
	if (res != FR_OK) return res;  

	dir = dj.dir;
	if (!dir)								 
		return FR_INVALID_NAME;
	if (dir[11] & 0x01)				 
		return FR_DENIED;
	dclst = ((DWORD)(WORD)(((WORD)*(BYTE*)((dir+20)+1)<<8)|(WORD)*(BYTE*)(dir+20)) << 16) | (WORD)(((WORD)*(BYTE*)((dir+26)+1)<<8)|(WORD)*(BYTE*)(dir+26));

	if (dir[11] & 0x10) {			 
		if (dclst < 2) return FR_INT_ERR;
		mem_cpy(&sdj, &dj, sizeof(DIR));	 
		sdj.sclust = dclst;
		res = dir_seek(&sdj, 2);
		if (res != FR_OK) return res;
		res = dir_read(&sdj);
		if (res == FR_OK) res = FR_DENIED;	 
		if (res != FR_NO_FILE) return res;
	}

	res = dir_remove(&dj);					 
	if (res == FR_OK) {
		if (dclst)
			res = remove_chain(dj.fs, dclst);	 
		if (res == FR_OK) res = sync(dj.fs);
	}

	return res;
}




 
 
 

FRESULT f_mkdir (
	const XCHAR *path		 
)
{
	FRESULT res;
	DIR dj;
	BYTE sfn[12];
	BYTE *dir, n;
	DWORD dsect, dclst, pclst, tim;


	res = chk_mounted(&path, &dj.fs, 1);
	if (res != FR_OK) return res;

	dj . fn = sfn;
	res = follow_path(&dj, path);			 
	if (res == FR_OK) res = FR_EXIST;		 
	if (0 && res == FR_NO_FILE && (dj.fn[11] & 0x20))
		res = FR_INVALID_NAME;
	if (res != FR_NO_FILE)					 
		return res;

	dclst = create_chain(dj.fs, 0);			 
	res = FR_OK;
	if (dclst == 0) res = FR_DENIED;
	if (dclst == 1) res = FR_INT_ERR;
	if (dclst == 0xFFFFFFFF) res = FR_DISK_ERR;
	if (res == FR_OK)
		res = move_window(dj.fs, 0);
	if (res != FR_OK) return res;
	dsect = clust2sect(dj.fs, dclst);

	dir = dj.fs->win;						 
	mem_set(dir, 0, 512U);
	mem_set(dir+0, ' ', 8+3);		 
	dir[0] = '.';
	dir[11] = 0x10;
	tim = get_fattime();
	*(BYTE*)(dir+22)=(BYTE)(tim); *(BYTE*)((dir+22)+1)=(BYTE)((WORD)(tim)>>8); *(BYTE*)((dir+22)+2)=(BYTE)((DWORD)(tim)>>16); *(BYTE*)((dir+22)+3)=(BYTE)((DWORD)(tim)>>24);
	*(BYTE*)(dir+26)=(BYTE)(dclst); *(BYTE*)((dir+26)+1)=(BYTE)((WORD)(dclst)>>8);
	*(BYTE*)(dir+20)=(BYTE)(dclst >> 16); *(BYTE*)((dir+20)+1)=(BYTE)((WORD)(dclst >> 16)>>8);
	mem_cpy(dir+32, dir, 32); 			 
	dir[33] = '.';
	pclst = dj.sclust;
	if (dj.fs->fs_type == 3 && pclst == dj.fs->dirbase)
		pclst = 0;
	*(BYTE*)(dir+32+26)=(BYTE)(pclst); *(BYTE*)((dir+32+26)+1)=(BYTE)((WORD)(pclst)>>8);
	*(BYTE*)(dir+32+20)=(BYTE)(pclst >> 16); *(BYTE*)((dir+32+20)+1)=(BYTE)((WORD)(pclst >> 16)>>8);
	for (n = 0; n < dj.fs->csize; n++) {	 
		dj.fs->winsect = dsect++;
		dj.fs->wflag = 1;
		res = move_window(dj.fs, 0);
		if (res) return res;
		mem_set(dir, 0, 512U);
	}

	res = dir_register(&dj);
	if (res != FR_OK) {
		remove_chain(dj.fs, dclst);
	} else {
		dir = dj.dir;
		dir[11] = 0x10;					 
		*(BYTE*)(dir+22)=(BYTE)(tim); *(BYTE*)((dir+22)+1)=(BYTE)((WORD)(tim)>>8); *(BYTE*)((dir+22)+2)=(BYTE)((DWORD)(tim)>>16); *(BYTE*)((dir+22)+3)=(BYTE)((DWORD)(tim)>>24);			 
		*(BYTE*)(dir+26)=(BYTE)(dclst); *(BYTE*)((dir+26)+1)=(BYTE)((WORD)(dclst)>>8);		 
		*(BYTE*)(dir+20)=(BYTE)(dclst >> 16); *(BYTE*)((dir+20)+1)=(BYTE)((WORD)(dclst >> 16)>>8);
		dj.fs->wflag = 1;
		res = sync(dj.fs);
	}

	return res;
}




 
 
 

FRESULT f_chmod (
	const XCHAR *path,	 
	BYTE value,			 
	BYTE mask			 
)
{
	FRESULT res;
	DIR dj;
	BYTE sfn[12];
	BYTE *dir;


	res = chk_mounted(&path, &dj.fs, 1);
	if (res == FR_OK) {
		dj . fn = sfn;
		res = follow_path(&dj, path);		 
		if (0 && res == FR_OK && (dj.fn[11] & 0x20))
			res = FR_INVALID_NAME;
		if (res == FR_OK) {
			dir = dj.dir;
			if (!dir) {						 
				res = FR_INVALID_NAME;
			} else {						 
				mask &= 0x01|0x02|0x04|0x20;	 
				dir[11] = (value & mask) | (dir[11] & (BYTE)~mask);	 
				dj.fs->wflag = 1;
				res = sync(dj.fs);
			}
		}
	}

	return res;
}




 
 
 

FRESULT f_utime (
	const XCHAR *path,	 
	const FILINFO *fno	 
)
{
	FRESULT res;
	DIR dj;
	BYTE sfn[12];
	BYTE *dir;


	res = chk_mounted(&path, &dj.fs, 1);
	if (res == FR_OK) {
		dj . fn = sfn;
		res = follow_path(&dj, path);	 
		if (0 && res == FR_OK && (dj.fn[11] & 0x20))
			res = FR_INVALID_NAME;
		if (res == FR_OK) {
			dir = dj.dir;
			if (!dir) {				 
				res = FR_INVALID_NAME;
			} else {				 
				*(BYTE*)(dir+22)=(BYTE)(fno->ftime); *(BYTE*)((dir+22)+1)=(BYTE)((WORD)(fno->ftime)>>8);
				*(BYTE*)(dir+24)=(BYTE)(fno->fdate); *(BYTE*)((dir+24)+1)=(BYTE)((WORD)(fno->fdate)>>8);
				dj.fs->wflag = 1;
				res = sync(dj.fs);
			}
		}
	}

	return res;
}




 
 
 

FRESULT f_rename (
	const XCHAR *path_old,	 
	const XCHAR *path_new	 
)
{
	FRESULT res;
	DIR dj_old, dj_new;
	BYTE sfn[12];
	BYTE buf[21], *dir;
	DWORD dw;


	dj_old . fn = sfn;
	res = chk_mounted(&path_old, &dj_old.fs, 1);
	if (res == FR_OK) {
		dj_new.fs = dj_old.fs;
		res = follow_path(&dj_old, path_old);	 
		if (0 && res == FR_OK && (dj_old.fn[11] & 0x20))
			res = FR_INVALID_NAME;
	}
	if (res != FR_OK) return res;	 

	if (!dj_old.dir) return FR_NO_FILE;	 
	mem_cpy(buf, dj_old.dir+11, 21);		 

	mem_cpy(&dj_new, &dj_old, sizeof(DIR));
	res = follow_path(&dj_new, path_new);		 
	if (res == FR_OK) res = FR_EXIST;			 
	if (res == FR_NO_FILE) { 					 
		res = dir_register(&dj_new);			 
		if (res == FR_OK) {
			dir = dj_new.dir;					 
			mem_cpy(dir+13, buf+2, 19);
			dir[11] = buf[0] | 0x20;
			dj_old.fs->wflag = 1;
			if (dir[11] & 0x10) {		 
				dw = clust2sect(dj_new.fs, (DWORD)(WORD)(((WORD)*(BYTE*)((dir+20)+1)<<8)|(WORD)*(BYTE*)(dir+20)) | (WORD)(((WORD)*(BYTE*)((dir+26)+1)<<8)|(WORD)*(BYTE*)(dir+26)));
				if (!dw) {
					res = FR_INT_ERR;
				} else {
					res = move_window(dj_new.fs, dw);
					dir = dj_new.fs->win+32;
					if (res == FR_OK && dir[1] == '.') {
						dw = (dj_new.fs->fs_type == 3 && dj_new.sclust == dj_new.fs->dirbase) ? 0 : dj_new.sclust;
						*(BYTE*)(dir+26)=(BYTE)(dw); *(BYTE*)((dir+26)+1)=(BYTE)((WORD)(dw)>>8);
						*(BYTE*)(dir+20)=(BYTE)(dw >> 16); *(BYTE*)((dir+20)+1)=(BYTE)((WORD)(dw >> 16)>>8);
						dj_new.fs->wflag = 1;
					}
				}
			}
			if (res == FR_OK) {
				res = dir_remove(&dj_old);			 
				if (res == FR_OK)
					res = sync(dj_old.fs);
			}
		}
	}

	return res;
}








 
 
 
#line 2767 "fatfs\\ff.c"




 
 
 






FRESULT f_mkfs (
	BYTE drv,			 
	BYTE partition,		 
	WORD allocsize		 
)
{
	static const DWORD sstbl[] = { 2048000, 1024000, 512000, 256000, 128000, 64000, 32000, 16000, 8000, 4000,   0 };
	static const WORD cstbl[] =  {   32768,   16384,   8192,   4096,   2048, 16384,  8192,  4096, 2048, 1024, 512 };
	BYTE fmt, m, *tbl;
	DWORD b_part, b_fat, b_dir, b_data;		 
	DWORD n_part, n_rsv, n_fat, n_dir;		 
	DWORD n_clst, d, n;
	WORD as;
	FATFS *fs;
	DSTATUS stat;


	 
	if (drv >= 1) return FR_INVALID_DRIVE;
	if (partition >= 2) return FR_MKFS_ABORTED;

	 
	fs = FatFs[drv];
	if (!fs) return FR_NOT_ENABLED;
	fs->fs_type = 0;
	drv = (drv);

	 
	stat = disk_initialize(drv);
	if (stat & 0x01) return FR_NOT_READY;
	if (stat & 0x04) return FR_WRITE_PROTECTED;





	if (disk_ioctl(drv, 1, &n_part) != RES_OK || n_part < 2000UL)
		return FR_MKFS_ABORTED;
	if (n_part > 131072000UL) n_part = 131072000UL;
	b_part = (!partition) ? 63 : 0;		 
	n_part -= b_part;
	for (d = 512; d <= 32768U && d != allocsize; d <<= 1) ;	 
	if (d != allocsize) allocsize = 0;
	if (!allocsize) {					 
		d = n_part;
		for (as = 512U; as > 512U; as >>= 1) d >>= 1;
		for (n = 0; d < sstbl[n]; n++) ;
		allocsize = cstbl[n];
	}
	if (allocsize < 512U) allocsize = 512U;

	allocsize /= 512U;		 

	 
	n_clst = n_part / allocsize;
	fmt = 1;
	if (n_clst >= 0xFF5) fmt = 2;
	if (n_clst >= 0xFFF5) fmt = 3;

	 
	switch (fmt) {
	case 1:
		n_fat = ((n_clst * 3 + 1) / 2 + 3 + 512U - 1) / 512U;
		n_rsv = 1 + partition;
		n_dir = 512 * 32 / 512U;
		break;
	case 2:
		n_fat = ((n_clst * 2) + 4 + 512U - 1) / 512U;
		n_rsv = 1 + partition;
		n_dir = 512 * 32 / 512U;
		break;
	default:
		n_fat = ((n_clst * 4) + 8 + 512U - 1) / 512U;
		n_rsv = 33 - partition;
		n_dir = 0;
	}
	b_fat = b_part + n_rsv;			 
	b_dir = b_fat + n_fat * 1;	 
	b_data = b_dir + n_dir;			 

	 
	if (disk_ioctl(drv, 3, &n) != RES_OK) return FR_MKFS_ABORTED;
	n = (b_data + n - 1) & ~(n - 1);
	n_fat += (n - b_data) / 1;
	 

	 
	n_clst = (n_part - n_rsv - n_fat * 1 - n_dir) / allocsize;
	if (   (fmt == 2 && n_clst < 0xFF5)
		|| (fmt == 3 && n_clst < 0xFFF5))
		return FR_MKFS_ABORTED;

	 
	if (!partition) {
		DWORD n_disk = b_part + n_part;

		mem_set(fs->win, 0, 512U);
		tbl = fs->win+446;
		*(BYTE*)(tbl)=(BYTE)(0x00010180); *(BYTE*)((tbl)+1)=(BYTE)((WORD)(0x00010180)>>8); *(BYTE*)((tbl)+2)=(BYTE)((DWORD)(0x00010180)>>16); *(BYTE*)((tbl)+3)=(BYTE)((DWORD)(0x00010180)>>24);		 
		if (n_disk < 63UL * 255 * 1024) {	 
			n_disk = n_disk / 63 / 255;
			tbl[7] = (BYTE)n_disk;
			tbl[6] = (BYTE)((n_disk >> 2) | 63);
		} else {
			*(BYTE*)(&tbl[6])=(BYTE)(0xFFFF); *(BYTE*)((&tbl[6])+1)=(BYTE)((WORD)(0xFFFF)>>8);
		}
		tbl[5] = 254;
		if (fmt != 3)			 
			tbl[4] = (n_part < 0x10000) ? 0x04 : 0x06;
		else
			tbl[4] = 0x0c;
		*(BYTE*)(tbl+8)=(BYTE)(63); *(BYTE*)((tbl+8)+1)=(BYTE)((WORD)(63)>>8); *(BYTE*)((tbl+8)+2)=(BYTE)((DWORD)(63)>>16); *(BYTE*)((tbl+8)+3)=(BYTE)((DWORD)(63)>>24);			 
		*(BYTE*)(tbl+12)=(BYTE)(n_part); *(BYTE*)((tbl+12)+1)=(BYTE)((WORD)(n_part)>>8); *(BYTE*)((tbl+12)+2)=(BYTE)((DWORD)(n_part)>>16); *(BYTE*)((tbl+12)+3)=(BYTE)((DWORD)(n_part)>>24);		 
		*(BYTE*)(tbl+64)=(BYTE)(0xAA55); *(BYTE*)((tbl+64)+1)=(BYTE)((WORD)(0xAA55)>>8);		 
		if (disk_write(drv, fs->win, 0, 1) != RES_OK)
			return FR_DISK_ERR;
		partition = 0xF8;
	} else {
		partition = 0xF0;
	}

	 
	tbl = fs->win;								 
	mem_set(tbl, 0, 512U);
	*(BYTE*)(tbl+0)=(BYTE)(0x90FEEB); *(BYTE*)((tbl+0)+1)=(BYTE)((WORD)(0x90FEEB)>>8); *(BYTE*)((tbl+0)+2)=(BYTE)((DWORD)(0x90FEEB)>>16); *(BYTE*)((tbl+0)+3)=(BYTE)((DWORD)(0x90FEEB)>>24);			 
	*(BYTE*)(tbl+11)=(BYTE)(512U); *(BYTE*)((tbl+11)+1)=(BYTE)((WORD)(512U)>>8);		 
	tbl[13] = (BYTE)allocsize;		 
	*(BYTE*)(tbl+14)=(BYTE)(n_rsv); *(BYTE*)((tbl+14)+1)=(BYTE)((WORD)(n_rsv)>>8);			 
	tbl[16] = 1;					 
	*(BYTE*)(tbl+17)=(BYTE)(512U / 32 * n_dir); *(BYTE*)((tbl+17)+1)=(BYTE)((WORD)(512U / 32 * n_dir)>>8);  
	if (n_part < 0x10000) {						 
		*(BYTE*)(tbl+19)=(BYTE)(n_part); *(BYTE*)((tbl+19)+1)=(BYTE)((WORD)(n_part)>>8);
	} else {
		*(BYTE*)(tbl+32)=(BYTE)(n_part); *(BYTE*)((tbl+32)+1)=(BYTE)((WORD)(n_part)>>8); *(BYTE*)((tbl+32)+2)=(BYTE)((DWORD)(n_part)>>16); *(BYTE*)((tbl+32)+3)=(BYTE)((DWORD)(n_part)>>24);
	}
	tbl[21] = partition;					 
	*(BYTE*)(tbl+24)=(BYTE)(63); *(BYTE*)((tbl+24)+1)=(BYTE)((WORD)(63)>>8);				 
	*(BYTE*)(tbl+26)=(BYTE)(255); *(BYTE*)((tbl+26)+1)=(BYTE)((WORD)(255)>>8);				 
	*(BYTE*)(tbl+28)=(BYTE)(b_part); *(BYTE*)((tbl+28)+1)=(BYTE)((WORD)(b_part)>>8); *(BYTE*)((tbl+28)+2)=(BYTE)((DWORD)(b_part)>>16); *(BYTE*)((tbl+28)+3)=(BYTE)((DWORD)(b_part)>>24);			 
	n = get_fattime();							 
	if (fmt != 3) {
		*(BYTE*)(tbl+39)=(BYTE)(n); *(BYTE*)((tbl+39)+1)=(BYTE)((WORD)(n)>>8); *(BYTE*)((tbl+39)+2)=(BYTE)((DWORD)(n)>>16); *(BYTE*)((tbl+39)+3)=(BYTE)((DWORD)(n)>>24);				 
		*(BYTE*)(tbl+22)=(BYTE)(n_fat); *(BYTE*)((tbl+22)+1)=(BYTE)((WORD)(n_fat)>>8);		 
		tbl[36] = 0x80;					 
		tbl[38] = 0x29;					 
		mem_cpy(tbl+43, "NO NAME    FAT     ", 19);	 
	} else {
		*(BYTE*)(tbl+67)=(BYTE)(n); *(BYTE*)((tbl+67)+1)=(BYTE)((WORD)(n)>>8); *(BYTE*)((tbl+67)+2)=(BYTE)((DWORD)(n)>>16); *(BYTE*)((tbl+67)+3)=(BYTE)((DWORD)(n)>>24);			 
		*(BYTE*)(tbl+36)=(BYTE)(n_fat); *(BYTE*)((tbl+36)+1)=(BYTE)((WORD)(n_fat)>>8); *(BYTE*)((tbl+36)+2)=(BYTE)((DWORD)(n_fat)>>16); *(BYTE*)((tbl+36)+3)=(BYTE)((DWORD)(n_fat)>>24);		 
		*(BYTE*)(tbl+44)=(BYTE)(2); *(BYTE*)((tbl+44)+1)=(BYTE)((WORD)(2)>>8); *(BYTE*)((tbl+44)+2)=(BYTE)((DWORD)(2)>>16); *(BYTE*)((tbl+44)+3)=(BYTE)((DWORD)(2)>>24);			 
		*(BYTE*)(tbl+48)=(BYTE)(1); *(BYTE*)((tbl+48)+1)=(BYTE)((WORD)(1)>>8);				 
		*(BYTE*)(tbl+50)=(BYTE)(6); *(BYTE*)((tbl+50)+1)=(BYTE)((WORD)(6)>>8);			 
		tbl[64] = 0x80;				 
		tbl[66] = 0x29;				 
		mem_cpy(tbl+71, "NO NAME    FAT32   ", 19);	 
	}
	*(BYTE*)(tbl+510)=(BYTE)(0xAA55); *(BYTE*)((tbl+510)+1)=(BYTE)((WORD)(0xAA55)>>8);				 
	if (512U > 512U) {
		*(BYTE*)(tbl+512U-2)=(BYTE)(0xAA55); *(BYTE*)((tbl+512U-2)+1)=(BYTE)((WORD)(0xAA55)>>8);
	}
	if (disk_write(drv, tbl, b_part+0, 1) != RES_OK)
		return FR_DISK_ERR;
	if (fmt == 3)
		disk_write(drv, tbl, b_part+6, 1);

	 
	for (m = 0; m < 1; m++) {
		mem_set(tbl, 0, 512U);		 
		if (fmt != 3) {
			n = (fmt == 1) ? 0x00FFFF00 : 0xFFFFFF00;
			n |= partition;
			*(BYTE*)(tbl)=(BYTE)(n); *(BYTE*)((tbl)+1)=(BYTE)((WORD)(n)>>8); *(BYTE*)((tbl)+2)=(BYTE)((DWORD)(n)>>16); *(BYTE*)((tbl)+3)=(BYTE)((DWORD)(n)>>24);				 
		} else {
			*(BYTE*)(tbl+0)=(BYTE)(0xFFFFFFF8); *(BYTE*)((tbl+0)+1)=(BYTE)((WORD)(0xFFFFFFF8)>>8); *(BYTE*)((tbl+0)+2)=(BYTE)((DWORD)(0xFFFFFFF8)>>16); *(BYTE*)((tbl+0)+3)=(BYTE)((DWORD)(0xFFFFFFF8)>>24);	 
			*(BYTE*)(tbl+4)=(BYTE)(0xFFFFFFFF); *(BYTE*)((tbl+4)+1)=(BYTE)((WORD)(0xFFFFFFFF)>>8); *(BYTE*)((tbl+4)+2)=(BYTE)((DWORD)(0xFFFFFFFF)>>16); *(BYTE*)((tbl+4)+3)=(BYTE)((DWORD)(0xFFFFFFFF)>>24);
			*(BYTE*)(tbl+8)=(BYTE)(0x0FFFFFFF); *(BYTE*)((tbl+8)+1)=(BYTE)((WORD)(0x0FFFFFFF)>>8); *(BYTE*)((tbl+8)+2)=(BYTE)((DWORD)(0x0FFFFFFF)>>16); *(BYTE*)((tbl+8)+3)=(BYTE)((DWORD)(0x0FFFFFFF)>>24);	 
		}
		if (disk_write(drv, tbl, b_fat++, 1) != RES_OK)
			return FR_DISK_ERR;
		mem_set(tbl, 0, 512U);		 
		for (n = 1; n < n_fat; n++) {
			if (disk_write(drv, tbl, b_fat++, 1) != RES_OK)
				return FR_DISK_ERR;
		}
	}

	 
	m = (BYTE)((fmt == 3) ? allocsize : n_dir);
	do {
		if (disk_write(drv, tbl, b_fat++, 1) != RES_OK)
			return FR_DISK_ERR;
	} while (--m);

	 
	if (fmt == 3) {
		*(BYTE*)(tbl+510)=(BYTE)(0xAA55); *(BYTE*)((tbl+510)+1)=(BYTE)((WORD)(0xAA55)>>8);
		*(BYTE*)(tbl+0)=(BYTE)(0x41615252); *(BYTE*)((tbl+0)+1)=(BYTE)((WORD)(0x41615252)>>8); *(BYTE*)((tbl+0)+2)=(BYTE)((DWORD)(0x41615252)>>16); *(BYTE*)((tbl+0)+3)=(BYTE)((DWORD)(0x41615252)>>24);
		*(BYTE*)(tbl+484)=(BYTE)(0x61417272); *(BYTE*)((tbl+484)+1)=(BYTE)((WORD)(0x61417272)>>8); *(BYTE*)((tbl+484)+2)=(BYTE)((DWORD)(0x61417272)>>16); *(BYTE*)((tbl+484)+3)=(BYTE)((DWORD)(0x61417272)>>24);
		*(BYTE*)(tbl+488)=(BYTE)(n_clst - 1); *(BYTE*)((tbl+488)+1)=(BYTE)((WORD)(n_clst - 1)>>8); *(BYTE*)((tbl+488)+2)=(BYTE)((DWORD)(n_clst - 1)>>16); *(BYTE*)((tbl+488)+3)=(BYTE)((DWORD)(n_clst - 1)>>24);
		*(BYTE*)(tbl+492)=(BYTE)(0xFFFFFFFF); *(BYTE*)((tbl+492)+1)=(BYTE)((WORD)(0xFFFFFFFF)>>8); *(BYTE*)((tbl+492)+2)=(BYTE)((DWORD)(0xFFFFFFFF)>>16); *(BYTE*)((tbl+492)+3)=(BYTE)((DWORD)(0xFFFFFFFF)>>24);
		disk_write(drv, tbl, b_part+1, 1);
		disk_write(drv, tbl, b_part+7, 1);
	}

	return (disk_ioctl(drv, 0, (void*)0) == RES_OK) ? FR_OK : FR_DISK_ERR;
}






