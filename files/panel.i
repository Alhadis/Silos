%module panel_cffi
%{
#include <panel.h>
%}

typedef struct panel
{
  WINDOW *win;
  struct panel *below;
  struct panel *above;
  void *user;
} PANEL;


extern WINDOW * panel_window (const PANEL *);
extern void update_panels (void);
extern int hide_panel (PANEL *);
extern int show_panel (PANEL *);
extern int del_panel (PANEL *);
extern int top_panel (PANEL *);
extern int bottom_panel (PANEL *);
extern PANEL * new_panel (WINDOW *);
extern PANEL * panel_above (const PANEL *);
extern PANEL * panel_below (const PANEL *);
extern int set_panel_userptr (PANEL *, void *);
extern void * panel_userptr (const PANEL *);
extern int move_panel (PANEL *, int, int);
extern int replace_panel (PANEL *,WINDOW *);
extern int panel_hidden (const PANEL *);

