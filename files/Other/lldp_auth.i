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
 * @author Andi Palo
 * @ 17/07/2012
 *
 */

%module "nox.netapps.authenticator.lldpauth"

%{
#include "core_events.hh"
#include "pyrt/pycontext.hh"
#include "pyrt/pyevent.hh"
#include "pyrt/pyglue.hh"

#include "lldp_host_event.hh"

using namespace vigil;
using namespace vigil::applications;
%}

%import "netinet/netinet.i"
%import "pyrt/event.i"

%include "common-defs.i"
%include "std_string.i"
%include "cstring.i"
/*
 * Exposes lldp_host_events
 */

struct Lldp_host_event
    : public Event
{
    enum Action {
        AUTHENTICATE,
        DEAUTHENTICATE,
    };

    enum Enabled_field {
        EF_SWITCH        = 0x1 << 0,
        EF_LOCATION      = 0x1 << 1,
        EF_DLADDR        = 0x1 << 2,
        EF_NWADDR        = 0x1 << 3,
        EF_HOSTNAME      = 0x1 << 4,
        EF_HOST_NETID  = 0x1 << 5,
        EF_ALL           = (0x1 << 6) - 1
    };

    // AUTHENTICATE constructor
    Lldp_host_event(datapathid datapath_id_, uint16_t port_,
                    ethernetaddr dladdr_, uint32_t nwaddr_, int64_t hostname_,
                    int64_t host_netid_, uint32_t idle_timeout_,
                    uint32_t hard_timeout_);

    // DEAUTHENTICATE constructor
    Lldp_host_event(datapathid datapath_id_, uint16_t port_,
                    ethernetaddr dladdr_, uint32_t nwaddr_, int64_t hostname_,
                    int64_t host_netid_, uint32_t enabled_fields_);

    // -- only for use within python
    Lldp_host_event() : Event(static_get_name()) { }

    static const Event_name static_get_name() {
        return "Lldp_host_event";
    }

    Action              action;
    datapathid          datapath_id;
    uint16_t            port;
    ethernetaddr        dladdr;
    uint32_t            nwaddr;         // set to zero if no IP to auth
    int64_t             hostname;
    int64_t             host_netid;
    uint32_t            idle_timeout;
    uint32_t            hard_timeout;
    uint32_t            enabled_fields; // bit_mask of fields to observe

%pythoncode
%{
    def __str__(self):
        return 'Andi'
%}

%extend {
    static void fill_python_event(const Event& e, PyObject* proxy) const 
    {
        const Lldp_host_event& lhe = dynamic_cast<const Lldp_host_event&>(e);

        pyglue_setattr_string(proxy, "action", to_python((uint32_t)(lhe.action)));
        pyglue_setattr_string(proxy, "datapath_id", to_python(lhe.datapath_id));
        pyglue_setattr_string(proxy, "port", to_python(lhe.port));
        pyglue_setattr_string(proxy, "dladdr", to_python(lhe.dladdr));
        pyglue_setattr_string(proxy, "nwaddr", to_python(lhe.nwaddr));
        pyglue_setattr_string(proxy, "hostname", to_python(lhe.hostname));
        pyglue_setattr_string(proxy, "host_netid", to_python(lhe.host_netid));
        pyglue_setattr_string(proxy, "idle_timeout", to_python(lhe.idle_timeout));
        pyglue_setattr_string(proxy, "hard_timeout", to_python(lhe.hard_timeout));
        pyglue_setattr_string(proxy, "enabled_fields", to_python(lhe.enabled_fields));

        ((Event*)SWIG_Python_GetSwigThis(proxy)->ptr)->operator=(e);
    }

    static void register_event_converter(PyObject *ctxt) {
        if (!SWIG_Python_GetSwigThis(ctxt) || 
            !SWIG_Python_GetSwigThis(ctxt)->ptr) {
            throw std::runtime_error("Unable to access Python context.");
        }
        
        vigil::applications::PyContext* pyctxt = 
            (vigil::applications::PyContext*)SWIG_Python_GetSwigThis(ctxt)->ptr;
        pyctxt->register_event_converter<Lldp_host_event>
            (&Lldp_host_event_fill_python_event);
    }
}

};

