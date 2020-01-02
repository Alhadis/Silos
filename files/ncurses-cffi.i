%module ncurses_cffi
%{
#include <ncurses.h>
%}
extern int COLORS;
extern int COLOR_PAIRS;

#define COLOR_BLACK	0
#define COLOR_RED	1
#define COLOR_GREEN	2
#define COLOR_YELLOW	3
#define COLOR_BLUE	4
#define COLOR_MAGENTA	5
#define COLOR_CYAN	6
#define COLOR_WHITE	7

typedef struct screen  SCREEN;
typedef struct _win_st WINDOW;

typedef struct
{
    attr_t	attr;
    wchar_t	chars[CCHARW_MAX];
}
cchar_t;

struct _win_st
{
	NCURSES_SIZE_T _cury, _curx; /* current cursor position */

	/* window location and size */
	NCURSES_SIZE_T _maxy, _maxx; /* maximums of x and y, NOT window size */
	NCURSES_SIZE_T _begy, _begx; /* screen coords of upper-left-hand corner */

	short   _flags;		/* window state flags */

	/* attribute tracking */
	attr_t  _attrs;		/* current attribute for non-space character */
	int  _bkgd;		/* current background char/attribute pair */

	/* option values set by user */
	int	_notimeout;	/* no time out on function-key entry? */
	int	_clear;		/* consider all data in the window invalid? */
	int	_leaveok;	/* OK to not reset cursor on exit? */
	int	_scroll;	/* OK to scroll this window? */
	int	_idlok;		/* OK to use insert/delete line? */
	int	_idcok;		/* OK to use insert/delete char? */
	int	_immed;		/* window in immed mode? (not yet used) */
	int	_sync;		/* window in sync mode? */
	int	_use_keypad;	/* process function keys into KEY_ symbols? */
	int	_delay;		/* 0 = nodelay, <0 = blocking, >0 = delay */

	struct ldat *_line;	/* the actual line data */

	/* global screen state */
	NCURSES_SIZE_T _regtop;	/* top line of scrolling region */
	NCURSES_SIZE_T _regbottom; /* bottom line of scrolling region */

	/* these are used only if this is a sub-window */
	int	_parx;		/* x coordinate of this window in parent */
	int	_pary;		/* y coordinate of this window in parent */
	WINDOW	*_parent;	/* pointer to parent if a sub-window */

	/* these are used only if this is a pad */
	struct pdat
	{
	    NCURSES_SIZE_T _pad_y,      _pad_x;
	    NCURSES_SIZE_T _pad_top,    _pad_left;
	    NCURSES_SIZE_T _pad_bottom, _pad_right;
	} _pad;

	NCURSES_SIZE_T _yoffset; /* real begy is _begy + _yoffset */

#ifdef _XOPEN_SOURCE_EXTENDED
	cchar_t  _bkgrnd;	/* current background char/attribute pair */
#endif
};

extern const char * curses_version (void);
extern int addch (const int);			/* generated */
extern int addchnstr (const int *, int);		/* generated */
extern int addchstr (const int *);			/* generated */
extern int addnstr (const char *, int);			/* generated */
extern int addstr (const char *);			/* generated */
extern int attroff (int);			/* generated */
extern int attron (int);			/* generated */
extern int attrset (int);			/* generated */
extern int attr_get (attr_t *, short *, void *);	/* generated */
extern int attr_off (attr_t, void *);			/* generated */
extern int attr_on (attr_t, void *);			/* generated */
extern int attr_set (attr_t, short, void *);		/* generated */
extern int baudrate (void);				/* implemented */
extern int beep  (void);				/* implemented */
extern int bkgd (int);				/* generated */
extern void bkgdset (int);				/* generated */
extern int border (int,int,int,int,int,int,int,int);	/* generated */
extern int box (WINDOW *, int, int);		/* generated */
extern int can_change_color (void);			/* implemented */
extern int cbreak (void);				/* implemented */
extern int chgat (int, attr_t, short, const void *);	/* generated */
extern int clearok (WINDOW *,int);			/* implemented */
extern int clrtobot (void);				/* generated */
extern int clrtoeol (void);				/* generated */
extern int color_content (short,short*,short*,short*);	/* implemented */
extern int color_set (short,void*);			/* generated */
extern int COLOR_PAIR (int);				/* generated */
extern int copywin (const WINDOW*,WINDOW*,int,int,int,int,int,int,int);	/* implemented */
extern int curs_set (int);				/* implemented */
extern int def_prog_mode (void);			/* implemented */
extern int def_shell_mode (void);			/* implemented */
extern int delay_output (int);				/* implemented */
extern int delch (void);				/* generated */
extern void delscreen (SCREEN *);			/* implemented */
extern int delwin (WINDOW *);				/* implemented */
extern int deleteln (void);				/* generated */
extern WINDOW * derwin (WINDOW *,int,int,int,int);	/* implemented */
extern int doupdate (void);				/* implemented */
extern WINDOW * dupwin (WINDOW *);			/* implemented */
extern int echo (void);					/* implemented */
extern int echochar (const int);			/* generated */
extern int erase (void);				/* generated */
extern int endwin (void);				/* implemented */
extern char erasechar (void);				/* implemented */
extern void filter (void);				/* implemented */
extern int flash (void);				/* implemented */
extern int flushinp (void);				/* implemented */
extern int getbkgd (WINDOW *);			/* generated */
extern int getch (void);				/* generated */
extern int getnstr (char *, int);			/* generated */
extern int getstr (char *);				/* generated */
extern WINDOW * getwin (FILE *);			/* implemented */
extern int halfdelay (int);				/* implemented */
extern int has_colors (void);				/* implemented */
extern int has_ic (void);				/* implemented */
extern int has_il (void);				/* implemented */
extern int hline (int, int);				/* generated */
extern void idcok (WINDOW *, int);			/* implemented */
extern int idlok (WINDOW *, int);			/* implemented */
extern void immedok (WINDOW *, int);			/* implemented */
extern int inch (void);				/* generated */
extern int inchnstr (int *, int);			/* generated */
extern int inchstr (int *);				/* generated */
extern WINDOW * initscr (void);				/* implemented */
extern int init_color (short,short,short,short);	/* implemented */
extern int init_pair (short,short,short);		/* implemented */
extern int innstr (char *, int);			/* generated */
extern int insch (int);				/* generated */
extern int insdelln (int);				/* generated */
extern int insertln (void);				/* generated */
extern int insnstr (const char *, int);			/* generated */
extern int insstr (const char *);			/* generated */
extern int instr (char *);				/* generated */
extern int intrflush (WINDOW *,int);			/* implemented */
extern int isendwin (void);				/* implemented */
extern int is_linetouched (WINDOW *,int);		/* implemented */
extern int is_wintouched (WINDOW *);			/* implemented */
extern char * keyname (int);		/* implemented */
extern int keypad (WINDOW *,int);			/* implemented */
extern char killchar (void);				/* implemented */
extern int leaveok (WINDOW *,int);			/* implemented */
extern char * longname (void);				/* implemented */
extern int meta (WINDOW *,int);			/* implemented */
extern int move (int, int);				/* generated */
extern int mvaddch (int, int, const int);		/* generated */
extern int mvaddchnstr (int, int, const int *, int);	/* generated */
extern int mvaddchstr (int, int, const int *);	/* generated */
extern int mvaddnstr (int, int, const char *, int);	/* generated */
extern int mvaddstr (int, int, const char *);		/* generated */
extern int mvchgat (int, int, int, attr_t, short, const void *);	/* generated */
extern int mvcur (int,int,int,int);			/* implemented */
extern int mvdelch (int, int);				/* generated */
extern int mvderwin (WINDOW *, int, int);		/* implemented */
extern int mvgetch (int, int);				/* generated */
extern int mvgetnstr (int, int, char *, int);		/* generated */
extern int mvgetstr (int, int, char *);			/* generated */
extern int mvhline (int, int, int, int);		/* generated */
extern int mvinch (int, int);			/* generated */
extern int mvinchnstr (int, int, int *, int);	/* generated */
extern int mvinchstr (int, int, int *);		/* generated */
extern int mvinnstr (int, int, char *, int);		/* generated */
extern int mvinsch (int, int, int);			/* generated */
extern int mvinsnstr (int, int, const char *, int);	/* generated */
extern int mvinsstr (int, int, const char *);		/* generated */
extern int mvinstr (int, int, char *);			/* generated */
//extern int mvprintw (int,int, const char *,...);		/* implemented */
//extern int mvscanw (int,int,  char *,...);	/* implemented */
extern int mvvline (int, int, int, int);		/* generated */
extern int mvwaddch (WINDOW *, int, int, const int);	/* generated */
extern int mvwaddchnstr (WINDOW *, int, int, const int *, int);/* generated */
extern int mvwaddchstr (WINDOW *, int, int, const int *);	/* generated */
extern int mvwaddnstr (WINDOW *, int, int, const char *, int);	/* generated */
extern int mvwaddstr (WINDOW *, int, int, const char *);	/* generated */
extern int mvwchgat (WINDOW *, int, int, int, attr_t, short, const void *);/* generated */
extern int mvwdelch (WINDOW *, int, int);		/* generated */
extern int mvwgetch (WINDOW *, int, int);		/* generated */
extern int mvwgetnstr (WINDOW *, int, int, char *, int);	/* generated */
extern int mvwgetstr (WINDOW *, int, int, char *);	/* generated */
extern int mvwhline (WINDOW *, int, int, int, int);	/* generated */
extern int mvwin (WINDOW *,int,int);			/* implemented */
extern int mvwinch (WINDOW *, int, int);			/* generated */
extern int mvwinchnstr (WINDOW *, int, int, int *, int);	/* generated */
extern int mvwinchstr (WINDOW *, int, int, int *);		/* generated */
extern int mvwinnstr (WINDOW *, int, int, char *, int);		/* generated */
extern int mvwinsch (WINDOW *, int, int, int);		/* generated */
extern int mvwinsnstr (WINDOW *, int, int, const char *, int);	/* generated */
extern int mvwinsstr (WINDOW *, int, int, const char *);		/* generated */
extern int mvwinstr (WINDOW *, int, int, char *);		/* generated */
//extern int mvwprintw (WINDOW*,int,int, const char *,...);
//extern int mvwscanw (WINDOW *,int,int,  char *,...);
extern int mvwvline (WINDOW *,int, int, int, int);	/* generated */
extern int napms (int);					/* implemented */
extern WINDOW * newpad (int,int);				/* implemented */
extern SCREEN * newterm ( char *,FILE *,FILE *);	/* implemented */
extern WINDOW * newwin (int,int,int,int);			/* implemented */
extern int nl (void);					/* implemented */
extern int nocbreak (void);				/* implemented */
extern int nodelay (WINDOW *,int);			/* implemented */
extern int noecho (void);				/* implemented */
extern int nonl (void);					/* implemented */
extern void noqiflush (void);				/* implemented */
extern int noraw (void);				/* implemented */
extern int notimeout (WINDOW *,int);			/* implemented */
extern int overlay (const WINDOW*,WINDOW *);		/* implemented */
extern int overwrite (const WINDOW*,WINDOW *);		/* implemented */
extern int pair_content (short,short*,short*);		/* implemented */
extern int PAIR_NUMBER (int);				/* generated */
extern int pechochar (WINDOW *, const int);		/* implemented */
extern int pnoutrefresh (WINDOW*,int,int,int,int,int,int);/* implemented */
extern int prefresh (WINDOW *,int,int,int,int,int,int);	/* implemented */
//extern int printw (const char *,...);			/* implemented */
extern int putp (const char *);				/* implemented */
extern int putwin (WINDOW *, FILE *);			/* implemented */
extern void qiflush (void);				/* implemented */
extern int raw (void);					/* implemented */
extern int redrawwin (WINDOW *);			/* generated */
extern int refresh (void);				/* generated */
extern int resetty (void);				/* implemented */
extern int reset_prog_mode (void);			/* implemented */
extern int reset_shell_mode (void);			/* implemented */
extern int ripoffline (int, int (*)(WINDOW *, int));	/* implemented */
extern int savetty (void);				/* implemented */
//extern int scanw ( char *,...);		/* implemented */
extern int scr_dump (const char *);			/* implemented */
extern int scr_init (const char *);			/* implemented */
extern int scrl (int);					/* generated */
extern int scroll (WINDOW *);				/* generated */
extern int scrollok (WINDOW *,int);			/* implemented */
extern int scr_restore (const char *);			/* implemented */
extern int scr_set (const char *);			/* implemented */
extern int setscrreg (int,int);				/* generated */
extern SCREEN * set_term (SCREEN *);			/* implemented */
extern int slk_attroff (const int);			/* implemented */
extern int slk_attr_off (const attr_t, void *);		/* generated:WIDEC */
extern int slk_attron (const int);			/* implemented */
extern int slk_attr_on (attr_t,void*);			/* generated:WIDEC */
extern int slk_attrset (const int);			/* implemented */
extern attr_t slk_attr (void);				/* implemented */
extern int slk_attr_set (const attr_t,short,void*);	/* implemented */
extern int slk_clear (void);				/* implemented */
extern int slk_color (short);				/* implemented */
extern int slk_init (int);				/* implemented */
extern char * slk_label (int);				/* implemented */
extern int slk_noutrefresh (void);			/* implemented */
extern int slk_refresh (void);				/* implemented */
extern int slk_restore (void);				/* implemented */
extern int slk_set (int,const char *,int);		/* implemented */
extern int slk_touch (void);				/* implemented */
extern int standout (void);				/* generated */
extern int standend (void);				/* generated */
extern int start_color (void);				/* implemented */
extern WINDOW * subpad (WINDOW *, int, int, int, int);	/* implemented */
extern WINDOW * subwin (WINDOW *,int,int,int,int);	/* implemented */
extern int syncok (WINDOW *, int);			/* implemented */
extern int termattrs (void);				/* implemented */
extern char * termname (void);				/* implemented */
extern int tigetflag ( char *);		/* implemented */
extern int tigetnum ( char *);		/* implemented */
extern char * tigetstr ( char *);		/* implemented */
extern void timeout (int);				/* generated */
extern int touchline (WINDOW *, int, int);		/* generated */
extern int touchwin (WINDOW *);				/* generated */
//extern char * tparm ( char *, ...);	/* implemented */
extern int typeahead (int);				/* implemented */
extern int ungetch (int);				/* implemented */
extern int untouchwin (WINDOW *);			/* generated */
extern void use_env (int);				/* implemented */
extern int vidattr (int);				/* implemented */
extern int vidputs (int, int (*)(int));		/* implemented */
extern int vline (int, int);				/* generated */
extern int vwprintw (WINDOW *, const char *,va_list);	/* implemented */
extern int vw_printw (WINDOW *, const char *,va_list);	/* generated */
extern int vwscanw (WINDOW *,  char *,va_list);	/* implemented */
extern int vw_scanw (WINDOW *,  char *,va_list);	/* generated */
extern int waddch (WINDOW *, const int);		/* implemented */
extern int waddchnstr (WINDOW *,const int *,int);	/* implemented */
extern int waddchstr (WINDOW *,const int *);		/* generated */
extern int waddnstr (WINDOW *,const char *,int);	/* implemented */
extern int waddstr (WINDOW *,const char *);		/* generated */
extern int wattron (WINDOW *, int);			/* generated */
extern int wattroff (WINDOW *, int);			/* generated */
extern int wattrset (WINDOW *, int);			/* generated */
extern int wattr_get (WINDOW *, attr_t *, short *, void *);	/* generated */
extern int wattr_on (WINDOW *, attr_t, void *);		/* implemented */
extern int wattr_off (WINDOW *, attr_t, void *);	/* implemented */
extern int wattr_set (WINDOW *, attr_t, short, void *);	/* generated */
extern int wbkgd (WINDOW *, int);			/* implemented */
extern void wbkgdset (WINDOW *,int);			/* implemented */
extern int wborder (WINDOW *,int,int,int,int,int,int,int,int);	/* implemented */
extern int wchgat (WINDOW *, int, attr_t, short, const void *);/* implemented */
extern int wclear (WINDOW *);				/* implemented */
extern int wclrtobot (WINDOW *);			/* implemented */
extern int wclrtoeol (WINDOW *);			/* implemented */
extern int wcolor_set (WINDOW*,short,void*);		/* implemented */
extern void wcursyncup (WINDOW *);			/* implemented */
extern int wdelch (WINDOW *);				/* implemented */
extern int wdeleteln (WINDOW *);			/* generated */
extern int wechochar (WINDOW *, const int);		/* implemented */
extern int werase (WINDOW *);				/* implemented */
extern int wgetch (WINDOW *);				/* implemented */
extern int wgetnstr (WINDOW *,char *,int);		/* implemented */
extern int wgetstr (WINDOW *, char *);			/* generated */
extern int whline (WINDOW *, int, int);		/* implemented */
extern int winch (WINDOW *);				/* implemented */
extern int winchnstr (WINDOW *, int *, int);		/* implemented */
extern int winchstr (WINDOW *, int *);		/* generated */
extern int winnstr (WINDOW *, char *, int);		/* implemented */
extern int winsch (WINDOW *, int);			/* implemented */
extern int winsdelln (WINDOW *,int);			/* implemented */
extern int winsertln (WINDOW *);			/* generated */
extern int winsnstr (WINDOW *, const char *,int);	/* implemented */
extern int winsstr (WINDOW *, const char *);		/* generated */
extern int winstr (WINDOW *, char *);			/* generated */
extern int wmove (WINDOW *,int,int);			/* implemented */
extern int wnoutrefresh (WINDOW *);			/* implemented */
//extern int wprintw (WINDOW *, const char *,...);		/* implemented */
extern int wredrawln (WINDOW *,int,int);		/* implemented */
extern int wrefresh (WINDOW *);				/* implemented */
//extern int wscanw (WINDOW *,  char *,...);	/* implemented */
extern int wscrl (WINDOW *,int);			/* implemented */
extern int wsetscrreg (WINDOW *,int,int);		/* implemented */
extern int wstandout (WINDOW *);			/* generated */
extern int wstandend (WINDOW *);			/* generated */
extern void wsyncdown (WINDOW *);			/* implemented */
extern void wsyncup (WINDOW *);				/* implemented */
extern void wtimeout (WINDOW *,int);			/* implemented */
extern int wtouchln (WINDOW *,int,int,int);		/* implemented */
extern int wvline (WINDOW *,int,int);		/* implemented */
extern int assume_default_colors (int, int);

extern int getattrs (WINDOW *);			/* generated */
extern int getcurx (WINDOW *);			/* generated */
extern int getcury (WINDOW *);			/* generated */
extern int getbegx (WINDOW *);			/* generated */
extern int getbegy (WINDOW *);			/* generated */
extern int getmaxx (WINDOW *);			/* generated */
extern int getmaxy (WINDOW *);			/* generated */
extern int getparx (WINDOW *);			/* generated */
extern int getpary (WINDOW *);			/* generated */
