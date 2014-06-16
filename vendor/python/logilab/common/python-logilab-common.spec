# for el5, force use of python2.6
%if 0%{?el5}
%define python python26
%define __python /usr/bin/python2.6
%{!?python_scriptarch: %define python_scriptarch %(%{__python} -c "from distutils.sysconfig import get_python_lib; from os.path import join; print join(get_python_lib(1, 1), 'scripts')")}
%else
%define python python
%define __python /usr/bin/python
%endif
%{!?_python_sitelib: %define _python_sitelib %(%{__python} -c "from distutils.sysconfig import get_python_lib; print get_python_lib()")}

Name:           %{python}-logilab-common
Version:        0.61.0
Release:        logilab.1%{?dist}
Summary:        Common libraries for Logilab projects

Group:          Development/Libraries
License:        LGPLv2.1+
URL:            http://www.logilab.org/projects/logilab-common
Source0:        http://download.logilab.org/pub/common/logilab-common-%{version}.tar.gz
BuildArch:      noarch
BuildRoot:      %(mktemp -ud %{_tmppath}/%{name}-%{version}-%{release}-XXXXXX)

BuildRequires:  python-devel python-setuptools python-unittest2
Requires:       mx


%description
This package contains several modules providing low level functionality 
shared among some python projects developed by logilab.


%prep
%setup -q -n logilab-common-%{version}


%build
%{__python} setup.py build
%if 0%{?el5}
# change the python version in shebangs
find . -name '*.py' -type f -print0 |  xargs -0 sed -i '1,3s;^#!.*python.*$;#! /usr/bin/python2.6;'
%endif


%install
rm -rf $RPM_BUILD_ROOT
NO_SETUPTOOLS=1 %{__python} setup.py install -O1 --skip-build --root $RPM_BUILD_ROOT %{?python_scriptarch: --install-scripts=%{python_scriptarch}}
rm -rf $RPM_BUILD_ROOT%{_python_sitelib}/logilab/common/test

%check
%{__python} setup.py test

%clean
rm -rf $RPM_BUILD_ROOT


%files
%defattr(-,root,root,-)
%doc README ChangeLog COPYING
%{_python_sitelib}/logilab*
%{_bindir}/*


%changelog
* Fri Nov 16 2012 Julien Cristau <julien.cristau@logilab.fr> 0.58.2-logilab.1
- Force python26 on el5

* Fri Aug 03 2012 Brian C. Lane <bcl@redhat.com> 0.58.2-1
- Upstream 0.58.2

* Sat Jul 21 2012 Fedora Release Engineering <rel-eng@lists.fedoraproject.org> - 0.57.1-3
- Rebuilt for https://fedoraproject.org/wiki/Fedora_18_Mass_Rebuild

* Sat Jan 14 2012 Fedora Release Engineering <rel-eng@lists.fedoraproject.org> - 0.57.1-2
- Rebuilt for https://fedoraproject.org/wiki/Fedora_17_Mass_Rebuild

* Fri Nov 18 2011 Brian C. Lane <bcl@redhat.com> - 0.57.1-1
- Upstream 0.57.1

* Fri Jul 29 2011 Brian C. Lane <bcl@redhat.com> - 0.56.0-1
- Upstream 0.56.0

* Mon Mar 28 2011 Brian C. Lane <bcl@redhat.com> - 0.55.1-1
- Upstream 0.55.1
- Add unit tests to spec

* Tue Feb 08 2011 Fedora Release Engineering <rel-eng@lists.fedoraproject.org> - 0.53.0-2
- Rebuilt for https://fedoraproject.org/wiki/Fedora_15_Mass_Rebuild

* Mon Nov 29 2010 Brian C. Lane <bcl@redhat.com> - 0.53.0-1
- Upstream 0.53.0

* Thu Jul 22 2010 David Malcolm <dmalcolm@redhat.com> - 0.50.3-2
- Rebuilt for https://fedoraproject.org/wiki/Features/Python_2.7/MassRebuild

* Thu Jul 08 2010 Brian C. Lane <bcl@brdhat.com> - 0.50.3-1
- Upstream 0.50.3

* Fri Mar 26 2010 Brian C. Lane <bcl@redhat.com> - 0.49.0-2
- Add python-setuptools to BuildRequires

* Thu Mar 25 2010 Brian C. Lane <bcl@redhat.com> - 0.49.0-1
- Upstream 0.49.0

* Sun Aug 30 2009 Konstantin Ryabitsev <icon@fedoraproject.org> - 0.45.0-1
- Upstream 0.45.0 (small enhancements and bugfixes)

* Sun Jul 26 2009 Fedora Release Engineering <rel-eng@lists.fedoraproject.org> - 0.41.0-3
- Rebuilt for https://fedoraproject.org/wiki/Fedora_12_Mass_Rebuild

* Wed Jun 17 2009 Konstantin Ryabitsev <icon@fedoraproject.org> - 0.41.0-2
- Upstream 0.41.0
- Bugfixes and a few minor new features

* Thu Feb 26 2009 Fedora Release Engineering <rel-eng@lists.fedoraproject.org> - 0.38.0-2
- Rebuilt for https://fedoraproject.org/wiki/Fedora_11_Mass_Rebuild

* Wed Jan 28 2009 Konstantin Ryabitsev <icon@fedoraproject.org> - 0.38.0-1
- Upstream 0.38.0

* Tue Dec 30 2008 Konstantin Ryabitsev <icon@fedoraproject.org> - 0.37.0-1
- Upstream 0.37.0

* Sat Nov 29 2008 Ignacio Vazquez-Abrams <ivazqueznet+rpm@gmail.com> - 0.32.0-2
- Rebuild for Python 2.6

* Mon Jun 30 2008 Konstantin Ryabitsev <icon@fedoraproject.org> - 0.32.0-1
- Upstream 0.32.0

* Sun Feb 17 2008 Konstantin Ryabitsev <icon@fedoraproject.org> - 0.28.0-1
- Upstream 0.28.0

* Thu Jan 17 2008 Konstantin Ryabitsev <icon@fedoraproject.org> - 0.26.1-1
- Upstream 0.26.1
- Package egg-info and other files.

* Mon Dec 24 2007 Konstantin Ryabitsev <icon@fedoraproject.org> - 0.25.2-1
- Upstream 0.25.2

* Sun Nov 18 2007 Konstantin Ryabitsev <icon@fedoraproject.org> - 0.24.0-1
- Upstream 0.24.0
- Adjust license to the new standard

* Sun Apr 01 2007 Konstantin Ryabitsev <icon@fedoraproject.org> - 0.21.2-1
- Upstream 0.21.2

* Sun Dec 17 2006 Konstantin Ryabitsev <icon@fedoraproject.org> - 0.21.0-1
- Upstream 0.21.0
- Include COPYING with docs

* Tue Sep 26 2006 Konstantin Ryabitsev <icon@fedoraproject.org> - 0.19.2-1
- Upstream 0.19.2
- Ghostbusting
- Require mx

* Mon May 01 2006 Konstantin Ryabitsev <icon@fedoraproject.org> - 0.15.0-1
- Version 0.15.0

* Sun Mar 12 2006 Konstantin Ryabitsev <icon@fedoraproject.org> - 0.14.1-2
- Also handle __init__.pyc and __init__.pyo

* Sun Mar 12 2006 Konstantin Ryabitsev <icon@fedoraproject.org> - 0.14.1-1
- Version 0.14.1

* Thu Jan 12 2006 Konstantin Ryabitsev <icon@fedoraproject.org> - 0.13.0-1
- Version 0.13.0
- astng no longer part of the package

* Thu Nov 17 2005 Konstantin Ryabitsev <icon@fedoraproject.org> - 0.12.0-1
- Version 0.12.0

* Mon Jun 13 2005 Konstantin Ryabitsev <icon@linux.duke.edu> - 0.10.0-1
- Version 0.10.0.
- Disttagging.

* Thu May 05 2005 Konstantin Ryabitsev <icon@linux.duke.edu> - 0.9.3-3
- Fix paths.

* Tue Apr 26 2005 Konstantin Ryabitsev <icon@linux.duke.edu> - 0.9.3-2
- Ghost .pyo files.
- Get rid of test, which doesn't do anything.

* Fri Apr 22 2005 Konstantin Ryabitsev <icon@linux.duke.edu> - 0.9.3-1
- Initial packaging.
