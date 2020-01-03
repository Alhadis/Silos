// Adapted from UCT implementation by Pierre Gueth and Joel Schaerer, Copyright 2009
// http://github.com/joelthelion/uct
// 
// Authors: Travis Briggs, briggs.travis (at) gmail.com
//          Pierre Gueth and Joel Schaerer
// ===================================================
// Copyright (C) 2009 Travis Briggs
// 
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License
// along with this program. See the COPYING file. If not, see
// <http://www.gnu.org/licenses/>.

%module ruby_uct
%{
#include "ruby_uct.h"
%}

class Player {
public:
	Player(const std::string &name,Token player);

	Token get_player() const;
	virtual int *get_move(const Board *board,const Move * last_move) =0;
	virtual ~Player() {}

protected:
	std::string name;
	Token player;
};

class PlayerBot : public Player {
public:
	PlayerBot(Token player,double max_sec=1.5,int max_iteration=0,double uct_constant=1.);

	virtual int *get_move(const Board *board,const Move * last_move) ;
	virtual ~PlayerBot();
  


private:
	double max_sec;
	int max_iteration;
	Node * root;
};