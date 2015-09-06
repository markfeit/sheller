#
# RPM Spec for ShellER
#
# WARNING: This file is untested.
#

Name: sheller
Version: 0.1
Release: 1%{?dist}
Group: Development/Libraries
Summary: Shell Extra Routines
License: Apache License
URL: https://github.com/markfeit/sheller
BuildRoot: %{_topdir}/%{name}-%{version}-root

Source: 

%description
ShellER provides a set of extended functions for the Bourne shell in
POSIX environments.


%prep
%setup -q


%build
make


%install
rm -rf $RPM_BUILD_ROOT
make PREFIX=$RPM_BUILD_ROOT install


%clean
rm -rf $RPM_BUILD_ROOT


%files
%defattr(-,root,root)
%{_bindir}/*
%{_libexecdir}/%{name}
