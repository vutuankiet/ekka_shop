package com.example.ekka.entities;

import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

@Entity
@Table(name = "user", schema = "k34_dl", catalog = "")
@Data
public class UserEntity implements UserDetails {
    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Basic
    @Column(name = "EMAIL")
    private String email;
    @Basic
    @Column(name = "PASSWORD")
    private String password;
    @Basic
    @Column(name = "FULLNAME")
    private String fullName;
    @Basic
    @Column(name = "PHONE")
    private String phone;
    @Basic
    @Column(name = "ADDRESS")
    private String address;
    @Basic
    @Column(name = "ROLE")
    private String role;

    @Basic
    @Column(name = "State")
    private Integer state;

    @Basic
    @Column(name = "CREATED_AT")
    private Timestamp created_at;
    @Basic
    @Column(name = "UPDATED_AT")
    private Timestamp updated_at;
    @Basic
    @Column(name = "AVATAR")
    private String avatar;
    @Basic
    @Column(name = "BACKGROUND_PROFILE")
    private String background_profile;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        Set<GrantedAuthority> authorities = new HashSet<>();
        if (role != null)
            authorities.add(new SimpleGrantedAuthority("ROLE_" + role));
        return authorities;
    }

    @Override
    public String getUsername() {
        return this.email;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return state == 1 ? true : false;
    }
}
