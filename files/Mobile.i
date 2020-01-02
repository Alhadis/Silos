/*
 * Copyright (C) Shroom Studios, Inc - All Rights Reserved
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 *
 * Written by Ahmad Amireh <ahmad@shroom-studios.com>, September 2011
 */

%module Pixy
%{
  #include "Mobile.h"
%}

using Ogre::Real;
using Ogre::Vector3;
namespace Pixy
{
  class Renderable;
	class Mobile
	{
    public:

		Mobile();
		Mobile& operator=(const Mobile& rhs);
		Mobile(const Mobile& src);
		virtual ~Mobile();

    void move(int inWaypoint);

    bool isMoving() const;

    void setWalkSpeed(const float inSpeed);
    float getWalkSpeed() const;

    static void setDefaultWalkSpeed(const float inSpeed);
    static float getDefaultWalkSpeed();

    void rotateToEnemy();
    void rotateTo(const Ogre::Vector3& inDest);

    static void setRotationFactor(float inFactor);

	}; // end of Mobile class
} // end of Pixy namespace
