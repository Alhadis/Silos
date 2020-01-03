%{
#include "hgeguictrls.h"
%}

#define HGEK_LBUTTON	0x01
#define HGEK_RBUTTON	0x02
#define HGEK_MBUTTON	0x04

#define HGEK_ESCAPE		0x1B
#define HGEK_BACKSPACE	0x08
#define HGEK_TAB		0x09
#define HGEK_ENTER		0x0D
#define HGEK_SPACE		0x20

#define HGEK_SHIFT		0x10
#define HGEK_CTRL		0x11
#define HGEK_ALT		0x12

#define HGEK_LWIN		0x5B
#define HGEK_RWIN		0x5C
#define HGEK_APPS		0x5D

#define HGEK_PAUSE		0x13
#define HGEK_CAPSLOCK	0x14
#define HGEK_NUMLOCK	0x90
#define HGEK_SCROLLLOCK	0x91

#define HGEK_PGUP		0x21
#define HGEK_PGDN		0x22
#define HGEK_HOME		0x24
#define HGEK_END		0x23
#define HGEK_INSERT		0x2D
#define HGEK_DELETE		0x2E

#define HGEK_LEFT		0x25
#define HGEK_UP			0x26
#define HGEK_RIGHT		0x27
#define HGEK_DOWN		0x28

#define HGEK_0			0x30
#define HGEK_1			0x31
#define HGEK_2			0x32
#define HGEK_3			0x33
#define HGEK_4			0x34
#define HGEK_5			0x35
#define HGEK_6			0x36
#define HGEK_7			0x37
#define HGEK_8			0x38
#define HGEK_9			0x39

#define HGEK_A			0x41
#define HGEK_B			0x42
#define HGEK_C			0x43
#define HGEK_D			0x44
#define HGEK_E			0x45
#define HGEK_F			0x46
#define HGEK_G			0x47
#define HGEK_H			0x48
#define HGEK_I			0x49
#define HGEK_J			0x4A
#define HGEK_K			0x4B
#define HGEK_L			0x4C
#define HGEK_M			0x4D
#define HGEK_N			0x4E
#define HGEK_O			0x4F
#define HGEK_P			0x50
#define HGEK_Q			0x51
#define HGEK_R			0x52
#define HGEK_S			0x53
#define HGEK_T			0x54
#define HGEK_U			0x55
#define HGEK_V			0x56
#define HGEK_W			0x57
#define HGEK_X			0x58
#define HGEK_Y			0x59
#define HGEK_Z			0x5A

#define HGEK_GRAVE		0xC0
#define HGEK_MINUS		0xBD
#define HGEK_EQUALS		0xBB
#define HGEK_BACKSLASH	0xDC
#define HGEK_LBRACKET	0xDB
#define HGEK_RBRACKET	0xDD
#define HGEK_SEMICOLON	0xBA
#define HGEK_APOSTROPHE	0xDE
#define HGEK_COMMA		0xBC
#define HGEK_PERIOD		0xBE
#define HGEK_SLASH		0xBF

#define HGEK_NUMPAD0	0x60
#define HGEK_NUMPAD1	0x61
#define HGEK_NUMPAD2	0x62
#define HGEK_NUMPAD3	0x63
#define HGEK_NUMPAD4	0x64
#define HGEK_NUMPAD5	0x65
#define HGEK_NUMPAD6	0x66
#define HGEK_NUMPAD7	0x67
#define HGEK_NUMPAD8	0x68
#define HGEK_NUMPAD9	0x69

#define HGEK_MULTIPLY	0x6A
#define HGEK_DIVIDE		0x6F
#define HGEK_ADD		0x6B
#define HGEK_SUBTRACT	0x6D
#define HGEK_DECIMAL	0x6E

#define HGEK_F1			0x70
#define HGEK_F2			0x71
#define HGEK_F3			0x72
#define HGEK_F4			0x73
#define HGEK_F5			0x74
#define HGEK_F6			0x75
#define HGEK_F7			0x76
#define HGEK_F8			0x77
#define HGEK_F9			0x78
#define HGEK_F10		0x79
#define HGEK_F11		0x7A
#define HGEK_F12		0x7B


/*
** hgeGUIObject
*/
/*
class hgeGUIObject
{
public:
	hgeGUIObject();
	virtual			~hgeGUIObject();

	virtual void	Render() = 0;

	virtual void	Enter() {}
	virtual void	Leave() {}
	virtual void	Reset() {}
	virtual bool	IsDone() { return true; }
	virtual void	Focus(bool bFocused) {}
	virtual void	MouseOver(bool bOver) {}

	virtual bool	MouseMove(float x, float y) { return false; }
	virtual bool	MouseLButton(bool bDown) { return false; }
	virtual bool	MouseRButton(bool bDown) { return false; }
	virtual bool	MouseWheel(int nNotches) { return false; }
	virtual bool	KeyClick(int key, int chr) { return false; }

	virtual void	SetColor(DWORD _color) { color=_color; }
	
	int				id;
	bool			bStatic;
	bool			bVisible;
	bool			bEnabled;
	hgeRect			rect;
	DWORD			color;

	hgeGUI			*gui;
};
*/
/*
** HGE Font class
*/
class hgeFont
{
public:
	hgeFont(const char *filename, bool bMipmap=false);
	~hgeFont();

	void		Render(float x, float y, int align, const char *string);
	void		printf(float x, float y, int align, const char *format, ...);
	void		printfb(float x, float y, float w, float h, int align, const char *format, ...);

	void		SetColor(DWORD col);
	void		SetZ(float z);
	void		SetBlendMode(int blend);
	void		SetScale(float scale) {fScale=scale;}
	void		SetProportion(float prop) { fProportion=prop; }
	void		SetRotation(float rot) {fRot=rot;}
	void		SetTracking(float tracking) {fTracking=tracking;}
	void		SetSpacing(float spacing) {fSpacing=spacing;}

	DWORD		GetColor() const {return dwCol;}
	float		GetZ() const {return fZ;}
	int			GetBlendMode() const {return nBlend;}
	float		GetScale() const {return fScale;}
	float		GetProportion() const { return fProportion; }
	float		GetRotation() const {return fRot;}
	float		GetTracking() const {return fTracking;}
	float		GetSpacing() const {return fSpacing;}

	hgeSprite*	GetSprite(char chr) const { return letters[(unsigned char)chr]; }
	float		GetPreWidth(char chr) const { return pre[(unsigned char)chr]; }
	float		GetPostWidth(char chr) const { return post[(unsigned char)chr]; }
	float		GetHeight() const { return fHeight; }
	float		GetStringWidth(const char *string, bool bMultiline=true) const;

private:
	hgeFont();
	hgeFont(const hgeFont &fnt);
	hgeFont&	operator= (const hgeFont &fnt);

	char*		_get_line(char *file, char *line);

	static HGE	*hge;

	static char	buffer[1024];

	HTEXTURE	hTexture;
	hgeSprite*	letters[256];
	float		pre[256];
	float		post[256];
	float		fHeight;
	float		fScale;
	float		fProportion;
	float		fRot;
	float		fTracking;
	float		fSpacing;

	DWORD		dwCol;
	float		fZ;
	int			nBlend;
};
/*
** hgeGUI
*/
/*
class hgeGUI
{
public:
	hgeGUI();
	~hgeGUI();

	void			AddCtrl(hgeGUIObject *ctrl);
	void			DelCtrl(int id);
	hgeGUIObject*	GetCtrl(int id) const;

	void			MoveCtrl(int id, float x, float y);
	void			ShowCtrl(int id, bool bVisible);
	void			EnableCtrl(int id, bool bEnabled);

	void			SetNavMode(int mode);
	void			SetCursor(hgeSprite *spr);
	void			SetColor(DWORD color);
	void			SetFocus(int id);
	int				GetFocus() const;
	
	void			Enter();
	void			Leave();
	void			Reset();
	void			Move(float dx, float dy);

	int				Update(float dt);
	void			Render();
};
*/


/*
** hgeGUIText
*/
/*
class hgeGUIText : public hgeGUIObject
{
public:
	hgeGUIText(int id, const hgeRect &rect, hgeFont *fnt);

	void			SetMode(int _align);
	void			SetText(const char *_text);
	void			printf(const char *format, ...);

	virtual void	Render();

private:
	hgeFont*		font;
	float			tx, ty;
	int				align;
	char			text[256];
};

*/
/*
** hgeGUIButton
*/
/*
class hgeGUIButton : public hgeGUIObject
{
public:
	hgeGUIButton(int id, const hgeRect &rect, HTEXTURE tex, float tx, float ty);
	virtual			~hgeGUIButton();

	void			SetMode(bool _bTrigger) { bTrigger=_bTrigger; }
	void			SetState(bool _bPressed) { bPressed=_bPressed; }
	bool			GetState() const { return bPressed; }

	virtual void	Render();
	virtual bool	MouseLButton(bool bDown);

private:
	bool			bTrigger;
	bool			bPressed;
	bool			bOldState;
	hgeSprite		*sprUp, *sprDown;
};
*/

/*
** hgeGUISlider
*/
#define HGESLIDER_BAR			0
#define HGESLIDER_BARRELATIVE	1
#define HGESLIDER_SLIDER		2
/*
class hgeGUISlider : public hgeGUIObject
{
public:
	hgeGUISlider(int id, const hgeRect &rect, HTEXTURE tex, float tx, float ty, float sw, float sh, bool vertical=false);
	virtual			~hgeGUISlider();

	void			SetMode(float _fMin, float _fMax, int _mode) { fMin=_fMin; fMax=_fMax; mode=_mode; }
	void			SetValue(float _fVal);
	float			GetValue() const { return fVal; }

	virtual void	Render();
	virtual bool	MouseMove(float x, float y);
	virtual bool	MouseLButton(bool bDown);

private:
	bool			bPressed;
	bool			bVertical;
	int				mode;
	float			fMin, fMax, fVal;
	float			sl_w, sl_h;
	hgeSprite		*sprSlider;
};

*/
/*
** hgeGUIListbox
*/
/*
class hgeGUIListbox : public hgeGUIObject
{
public:
	hgeGUIListbox(int id, const hgeRect &rect, hgeFont *fnt, DWORD tColor, DWORD thColor, DWORD hColor);
	virtual			~hgeGUIListbox();

	int				AddItem(char *item);
	void			DeleteItem(int n);
	int				GetSelectedItem() { return nSelectedItem; }
	void			SetSelectedItem(int n) { if(n>=0 && n<GetNumItems()) nSelectedItem=n; }
	int				GetTopItem() { return nTopItem; }
	void			SetTopItem(int n) { if(n>=0 && n<=GetNumItems()-GetNumRows()) nTopItem=n; }

	char			*GetItemText(int n);
	int				GetNumItems() { return nItems; }
	int				GetNumRows() { return int((rect.y2-rect.y1)/font->GetHeight()); }
	void			Clear();

	virtual void	Render();
	virtual bool	MouseMove(float x, float y) { mx=x; my=y; return false; }
	virtual bool	MouseLButton(bool bDown);
	virtual bool	MouseWheel(int nNotches);
	virtual bool	KeyClick(int key, int chr);

private:
	hgeSprite		*sprHighlight;
	hgeFont			*font;
	DWORD			textColor, texthilColor;

	int					nItems, nSelectedItem, nTopItem;
	float				mx, my;
	hgeGUIListboxItem	*pItems;
};
*/
struct hgeParticleSystemInfo
{
	//hgeSprite*	sprite;    // texture + blend mode
	int			nEmission; // particles per sec
	float		fLifetime;

	float		fParticleLifeMin;
	float		fParticleLifeMax;

	float		fDirection;
	float		fSpread;
	bool		bRelative;

	float		fSpeedMin;
	float		fSpeedMax;

	float		fGravityMin;
	float		fGravityMax;

	float		fRadialAccelMin;
	float		fRadialAccelMax;

	float		fTangentialAccelMin;
	float		fTangentialAccelMax;

	float		fSizeStart;
	float		fSizeEnd;
	float		fSizeVar;

	float		fSpinStart;
	float		fSpinEnd;
	float		fSpinVar;

	hgeColor	colColorStart; // + alpha
	hgeColor	colColorEnd;
	float		fColorVar;
	float		fAlphaVar;

	hgeParticleSystemInfo();
	~hgeParticleSystemInfo();
};

class hgeSprite
{
public:
	hgeSprite(HTEXTURE tex, float x, float y, float w, float h);
	hgeSprite(const hgeSprite &spr);
	~hgeSprite() { hge->Release(); }
	
	
	void		Render(float x, float y);
	void		RenderEx(float x, float y, float rot, float hscale=1.0f, float vscale=0.0f);
	void		RenderStretch(float x1, float y1, float x2, float y2);
	void		Render4V(float x0, float y0, float x1, float y1, float x2, float y2, float x3, float y3);

	void		SetTexture(HTEXTURE tex);
	void		SetTextureRect(float x, float y, float w, float h, bool adjSize = true);
	void		SetColor(DWORD col, int i=-1);
	void		SetZ(float z, int i=-1);
	void		SetBlendMode(int blend) { quad.blend=blend; }
	void		SetHotSpot(float x, float y) { hotX=x; hotY=y; }
	void		SetFlip(bool bX, bool bY, bool bHotSpot = false);

	HTEXTURE	GetTexture() const { return quad.tex; }
	void		GetTextureRect(float *x, float *y, float *w, float *h) const { *x=tx; *y=ty; *w=width; *h=height; }
	DWORD		GetColor(int i=0) const { return quad.v[i].col; }
	float		GetZ(int i=0) const { return quad.v[i].z; }
	int			GetBlendMode() const { return quad.blend; }
	void		GetHotSpot(float *x, float *y) const { *x=hotX; *y=hotY; }
	void		GetFlip(bool *bX, bool *bY) const { *bX=bXFlip; *bY=bYFlip; }

	float		GetWidth() const { return width; }
	float		GetHeight() const { return height; }
	hgeRect*	GetBoundingBox(float x, float y, hgeRect *rect) const { rect->Set(x-hotX, y-hotY, x-hotX+width, y-hotY+height); return rect; }
	hgeRect*	GetBoundingBoxEx(float x, float y, float rot, float hscale, float vscale,  hgeRect *rect) const;

protected:
	hgeSprite();
	static HGE	*hge;

	hgeQuad		quad;
	float		tx, ty, width, height;
	float		tex_width, tex_height;
	float		hotX, hotY;
	bool		bXFlip, bYFlip, bHSFlip;
};

class hgeColorRGB
{
public:
	float		r,g,b,a;

	hgeColorRGB(float _r, float _g, float _b, float _a) { r=_r; g=_g; b=_b; a=_a; }
	hgeColorRGB(DWORD col) { SetHWColor(col); }
	hgeColorRGB() { r=g=b=a=0; }
	~hgeColorRGB();

	hgeColorRGB		operator-  (const hgeColorRGB &c) const { return hgeColorRGB(r-c.r, g-c.g, b-c.b, a-c.a); }
	hgeColorRGB		operator+  (const hgeColorRGB &c) const { return hgeColorRGB(r+c.r, g+c.g, b+c.b, a+c.a); }
	hgeColorRGB		operator*  (const hgeColorRGB &c) const { return hgeColorRGB(r*c.r, g*c.g, b*c.b, a*c.a); }
	hgeColorRGB&	operator-= (const hgeColorRGB &c)		{ r-=c.r; g-=c.g; b-=c.b; a-=c.a; return *this;   }
	hgeColorRGB&	operator+= (const hgeColorRGB &c)		{ r+=c.r; g+=c.g; b+=c.b; a+=c.a; return *this;   }
	bool			operator== (const hgeColorRGB &c) const { return (r==c.r && g==c.g && b==c.b && a==c.a);  }
	bool			operator!= (const hgeColorRGB &c) const { return (r!=c.r || g!=c.g || b!=c.b || a!=c.a);  }

	hgeColorRGB		operator/  (const float scalar) const { return hgeColorRGB(r/scalar, g/scalar, b/scalar, a/scalar); }
	hgeColorRGB		operator*  (const float scalar) const { return hgeColorRGB(r*scalar, g*scalar, b*scalar, a*scalar); }
	hgeColorRGB&	operator*= (const float scalar)		  { r*=scalar; g*=scalar; b*=scalar; a*=scalar; return *this;   }

	void			Clamp() { ColorClamp(r); ColorClamp(g); ColorClamp(b); ColorClamp(a); }
	void			SetHWColor(DWORD col) {	a = (col>>24)/255.0f; r = ((col>>16) & 0xFF)/255.0f; g = ((col>>8) & 0xFF)/255.0f; b = (col & 0xFF)/255.0f;	}
	DWORD			GetHWColor() const { return (DWORD(a*255.0f)<<24) + (DWORD(r*255.0f)<<16) + (DWORD(g*255.0f)<<8) + DWORD(b*255.0f);	}
};
typedef hgeColorRGB hgeColor;