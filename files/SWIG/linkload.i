/* Copyright 2013 (C) Universita' di Roma La Sapienza
 *
 * This file is part of OFNIC Uniroma GE.
 *
 * OFNIC is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * OFNIC is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with OFNIC.  If not, see <http://www.gnu.org/licenses/>.
 */

/*
 * Author       Andi Palo
 * Organization Uniroma1
 * Date         01/07/2012
 *
 */

%module "nox.netapps.networkstate.linkload"
%{
#include "pylinkload.hh"

using namespace vigil;
using namespace vigil::applications;
%}

%import "netinet/netinet.i"

%include "common-defs.i"
%include "std_list.i"
%include "buffer.i"
%include "typemaps.i"


struct PyLoad
{
  /** Transmission load (in bytes)
   */
  uint64_t txLoad;
  /** Reception load (in bytes)
   */
  uint64_t rxLoad;
  /** Interval
   */
  time_t interval;
};

struct PyPortErrors
{
    uint64_t rxDropped;
    uint64_t txDropped;
    uint64_t rxErrors;
    uint64_t txErrors;
    uint64_t rxFrameErr;
    uint64_t rxOverErr;
    uint64_t rxCrcErr;
    uint64_t collisions;

    time_t interval;

    PyPortErrors(){;}
    PyPortErrors(uint64_t a, uint64_t b, uint64_t c, uint64_t d,
			uint64_t e, uint64_t f, uint64_t g, uint64_t h,
			time_t interval_) :
			rxDropped(a), txDropped(b), rxErrors(c), txErrors(d), rxFrameErr(
					e), rxOverErr(f), rxCrcErr(g), collisions(h), interval(
					interval_) {
	}

};
struct Pyflow_load{
    uint64_t    p_count;
    uint64_t    b_count;
    
    Pyflow_load(){;}
    Pyflow_load(uint64_t a, uint64_t b):
    p_count(a), b_count(b){}
};

class pylinkload_proxy{
public:

    pylinkload_proxy(PyObject* ctxt);

    void configure(PyObject*);
    void install(PyObject*);

	PyLoad get_link_load(datapathid dpid, uint16_t portID, bool& OUTPUT);
	PyPortErrors get_port_errors_proxy(datapathid dpid, uint16_t portID, bool& OUTPUT);
	Pyflow_load get_flow_load(uint32_t pathID, int& OUTPUT);
	uint32_t create_monitor_flow(uint16_t pathID, datapathid dpid, uint64_t duration, uint64_t frequency, int& OUTPUT);
	std::string get_path_mon_ids();
        int remove_monitor_flow(uint32_t monitorID);
	int dummyLoad();
 

protected:   
    container::Component* c;
}; // class linkload_proxy

%pythoncode
%{
from nox.lib.core import Component

class PyLinkLoad(Component):
    """
    An adaptor over the C++ based Python bindings to
    simplify their implementation.
    """  
    def __init__(self, ctxt):
        self.lload = pylinkload_proxy(ctxt)


    def configure(self, configuration):
        self.lload.configure(configuration)

    def install(self):
        pass

    def getInterface(self):
        return str(PyLinkLoad)

    def dLoad(self):
        return self.lload.dummyLoad()
        
    def get_link_load(self, dpid, portID):
        return self.lload.get_link_load(dpid, portID)
        
    def get_port_errors(self, dpid, portID):
        return self.lload.get_port_errors_proxy(dpid, portID)

    def get_flow_load(self, pathID):
        return self.lload.get_flow_load(pathID)

    def create_new_flow_monitor(self, pathID, dpid, duration, frequency):
        return self.lload.create_monitor_flow(pathID, dpid, duration, frequency)
    
    def remove_monitor_flow(self, monitorID):
        return self.lload.remove_monitor_flow(monitorID)

    def get_path_mon_ids(self):
        return self.lload.get_path_mon_ids()

def getFactory():
    class Factory():
        def instance(self, context):                    
            return PyLinkLoad(context)

    return Factory()
%}
