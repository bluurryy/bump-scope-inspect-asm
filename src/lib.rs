#![allow(
    non_camel_case_types,
    unused_imports,
    mismatched_lifetime_syntaxes,
    clippy::mut_from_ref,
    clippy::missing_safety_doc
)]

use std::{alloc::Global, alloc::Layout, ptr::NonNull};

use bump_scope::{
    config::{BumpConfig, BumpConfigBuilder},
    extra, Bump, BumpAllocation, BumpAllocator as _, MutBumpAllocator as _,
};

#[derive(Clone, Copy)]
#[repr(align(512))]
#[allow(dead_code)]
pub struct big([u8; 512]);

type vec3 = [u32; 3];

#[derive(Clone, Copy)]
pub struct zst;

const UP_1: BumpConfig = BumpConfigBuilder::new().upwards(true).min_align(1).build();
const UP_4: BumpConfig = BumpConfigBuilder::new().upwards(true).min_align(4).build();
const DOWN_1: BumpConfig = BumpConfigBuilder::new().upwards(false).min_align(1).build();
const DOWN_4: BumpConfig = BumpConfigBuilder::new().upwards(false).min_align(4).build();

macro_rules! alloc {
    (
        $(
            mod $mod:ident fn($bump:ident, $value:ident: $value_ty:ty) -> &$($lifetime:lifetime)? mut $ty:ty
            { $body:expr } try { $try_body:expr }
            else { $blink_body:expr } try { $try_blink_body:expr }
        )*
    ) => {

        $(
            pub mod $mod {
                use super::*;

                pub fn up$(<$lifetime>)?($bump: &$($lifetime)? Bump<Global, UP_1>, $value: $value_ty) -> &$($lifetime)? mut $ty {
                    $body.into_mut()
                }

                pub fn down$(<$lifetime>)?($bump: &$($lifetime)? Bump<Global, DOWN_1>, $value: $value_ty) -> &$($lifetime)? mut $ty {
                    $body.into_mut()
                }

                pub fn up_a$(<$lifetime>)?($bump: &$($lifetime)? Bump<Global, UP_4>, $value: $value_ty) -> &$($lifetime)? mut $ty {
                    $body.into_mut()
                }

                pub fn down_a$(<$lifetime>)?($bump: &$($lifetime)? Bump<Global, DOWN_4>, $value: $value_ty) -> &$($lifetime)? mut $ty {
                    $body.into_mut()
                }

                pub fn bumpalo$(<$lifetime>)?($bump: &$($lifetime)? bumpalo::Bump, $value: $value_ty) -> &$($lifetime)? mut $ty {
                    $body
                }

                pub fn bumpalo_a$(<$lifetime>)?($bump: &$($lifetime)? bumpalo::Bump<4>, $value: $value_ty) -> &$($lifetime)? mut $ty {
                    $body
                }

                pub fn try_up$(<$lifetime>)?($bump: &$($lifetime)? Bump<Global, UP_1>, $value: $value_ty) -> Option<&$($lifetime)? mut $ty> {
                    $try_body.ok().map(|x| x.into_mut())
                }

                pub fn try_down$(<$lifetime>)?($bump: &$($lifetime)? Bump<Global, DOWN_1>, $value: $value_ty) -> Option<&$($lifetime)? mut $ty> {
                    $try_body.ok().map(|x| x.into_mut())
                }

                pub fn try_up_a$(<$lifetime>)?($bump: &$($lifetime)? Bump<Global, UP_4>, $value: $value_ty) -> Option<&$($lifetime)? mut $ty> {
                    $try_body.ok().map(|x| x.into_mut())
                }

                pub fn try_down_a$(<$lifetime>)?($bump: &$($lifetime)? Bump<Global, DOWN_4>, $value: $value_ty) -> Option<&$($lifetime)? mut $ty> {
                    $try_body.ok().map(|x| x.into_mut())
                }

                pub fn try_bumpalo$(<$lifetime>)?($bump: &$($lifetime)? bumpalo::Bump, $value: $value_ty) -> Option<&$($lifetime)? mut $ty> {
                    $try_body.ok()
                }

                pub fn try_bumpalo_a$(<$lifetime>)?($bump: &$($lifetime)? bumpalo::Bump<4>, $value: $value_ty) -> Option<&$($lifetime)? mut $ty> {
                    $try_body.ok()
                }

                #[allow(unreachable_code, unused_variables)]
                pub fn blink_alloc$(<$lifetime>)?($bump: &$($lifetime)? blink_alloc::Blink, $value: $value_ty) -> &$($lifetime)? mut $ty {
                    $blink_body
                }

                #[allow(unreachable_code, unused_variables)]
                pub fn try_blink_alloc$(<$lifetime>)?($bump: &$($lifetime)? blink_alloc::Blink, $value: $value_ty) -> Option<&$($lifetime)? mut $ty> {
                    $try_blink_body
                }
            }
        )*
    };
}

macro_rules! alloc_try_with {
    (
        $(
            mod $mod:ident fn -> Result<&$($lifetime:lifetime)? mut $ok:ty, $err:ty>;
        )*
    ) => {

        $(
            pub mod $mod {
                use super::*;

                pub fn up$(<$lifetime>)?(bump: &$($lifetime)? Bump<Global, UP_1>, f: fn() -> Result<$ok, $err>) -> Result<&$($lifetime)? mut $ok, $err> {
                    bump.alloc_try_with(f).map(BumpAllocation::into_mut)
                }

                pub fn down$(<$lifetime>)?(bump: &$($lifetime)? Bump<Global, DOWN_1>, f: fn() -> Result<$ok, $err>) -> Result<&$($lifetime)? mut $ok, $err> {
                    bump.alloc_try_with(f).map(BumpAllocation::into_mut)
                }

                pub fn try_up$(<$lifetime>)?(bump: &$($lifetime)? Bump<Global, UP_1>, f: fn() -> Result<$ok, $err>) -> Option<Result<&$($lifetime)? mut $ok, $err>> {
                    bump.try_alloc_try_with(f).ok().map(|x| x.map(BumpAllocation::into_mut))
                }

                pub fn try_down$(<$lifetime>)?(bump: &$($lifetime)? Bump<Global, DOWN_1>, f: fn() -> Result<$ok, $err>) -> Option<Result<&$($lifetime)? mut $ok, $err>> {
                    bump.try_alloc_try_with(f).ok().map(|x| x.map(BumpAllocation::into_mut))
                }

                pub fn up_mut$(<$lifetime>)?(bump: &mut $($lifetime)? Bump<Global, UP_1>, f: fn() -> Result<$ok, $err>) -> Result<&$($lifetime)? mut $ok, $err> {
                   bump.alloc_try_with_mut(f).map(BumpAllocation::into_mut)
                }

                pub fn down_mut$(<$lifetime>)?(bump: &mut $($lifetime)? Bump<Global, DOWN_1>, f: fn() -> Result<$ok, $err>) -> Result<&$($lifetime)? mut $ok, $err> {
                    bump.alloc_try_with_mut(f).map(BumpAllocation::into_mut)
                }

                pub fn try_up_mut$(<$lifetime>)?(bump: &mut $($lifetime)? Bump<Global, UP_1>, f: fn() -> Result<$ok, $err>) -> Option<Result<&$($lifetime)? mut $ok, $err>> {
                    bump.try_alloc_try_with_mut(f).ok().map(|x| x.map(BumpAllocation::into_mut))
                }

                pub fn try_down_mut$(<$lifetime>)?(bump: &mut $($lifetime)? Bump<Global, DOWN_1>, f: fn() -> Result<$ok, $err>) -> Option<Result<&$($lifetime)? mut $ok, $err>> {
                    bump.try_alloc_try_with_mut(f).ok().map(|x| x.map(BumpAllocation::into_mut))
                }

                pub fn bumpalo$(<$lifetime>)?(bump: &$($lifetime)? bumpalo::Bump, f: fn() -> Result<$ok, $err>) -> Result<&$($lifetime)? mut $ok, $err> {
                    bump.alloc_try_with(f)
                }

                pub fn try_bumpalo$(<$lifetime>)?(bump: &$($lifetime)? bumpalo::Bump, f: fn() -> Result<$ok, $err>) -> Option<Result<&$($lifetime)? mut $ok, $err>> {
                    match bump.try_alloc_try_with(f) {
                        Ok(ok) => Some(Ok(ok)),
                        Err(err) => match err {
                            bumpalo::AllocOrInitError::Alloc(bumpalo::AllocErr) => None,
                            bumpalo::AllocOrInitError::Init(err) => Some(Err(err)),
                        },
                    }
                }
            }
        )*
    };
}

alloc! {
    mod alloc_zst fn(bump, value: zst) -> &mut zst { bump.alloc(value) } try { bump.try_alloc(value) } else { bump.emplace().value(value) } try { bump.emplace().try_value(value).ok() }
    mod alloc_u8 fn(bump, value: u8) -> &mut u8 { bump.alloc(value) } try { bump.try_alloc(value) } else { bump.emplace().value(value) } try { bump.emplace().try_value(value).ok() }
    mod alloc_u32 fn(bump, value: u32) -> &mut u32 { bump.alloc(value) } try { bump.try_alloc(value) } else { bump.emplace().value(value) } try { bump.emplace().try_value(value).ok() }
    mod alloc_vec3 fn(bump, value: vec3) -> &mut vec3 { bump.alloc(value) } try { bump.try_alloc(value) } else { bump.emplace().value(value) } try { bump.emplace().try_value(value).ok() }
    mod alloc_12_u32 fn(bump, value: [u32;12]) -> &mut [u32;12] { bump.alloc(value) } try { bump.try_alloc(value) } else { bump.emplace().value(value) } try { bump.emplace().try_value(value).ok() }
    mod alloc_big fn(bump, value: &big) -> &'a mut big { bump.alloc_with(|| *value) } try { bump.try_alloc_with(|| *value) } else { bump.emplace().value(*value) } try { bump.emplace().try_value(*value).ok() }
    mod alloc_str fn(bump, value: &str) -> &'a mut str { bump.alloc_str(value) } try { bump.try_alloc_str(value) } else { bump.copy_str(value) } try { bump.try_copy_str(value) }
    mod alloc_u32_slice fn(bump, value: &[u32]) -> &'a mut [u32] { bump.alloc_slice_copy(value) } try { bump.try_alloc_slice_copy(value) } else { bump.copy_slice(value) } try { bump.try_copy_slice(value) }
    mod alloc_u32_slice_clone fn(bump, value: &[u32]) -> &'a mut [u32] { bump.alloc_slice_clone(value) } try { bump.try_alloc_slice_clone(value) } else { unimplemented!() } try { unimplemented!() }
}

alloc_try_with! {
    mod alloc_try_u32 fn -> Result<&mut u32, u32>;
    mod alloc_try_big_ok fn -> Result<&mut big, u32>;
}

pub mod alloc_overaligned_but_size_matches {
    use super::*;

    pub fn up(bump: &Bump<Global, UP_4>, value: [u8; 4]) -> &[u8; 4] {
        bump.alloc(value).into_ref()
    }

    pub fn down(bump: &Bump<Global, DOWN_4>, value: [u8; 4]) -> &[u8; 4] {
        bump.alloc(value).into_ref()
    }

    pub fn down_big(bump: &Bump<Global, DOWN_4>, value: [u8; 40]) -> &[u8; 40] {
        bump.alloc(value).into_ref()
    }
}

#[derive(Clone)]
#[allow(dead_code)]
pub struct foo(u64);

#[cold]
#[inline(never)]
fn something() {
    println!("Hey");
}

impl Drop for foo {
    fn drop(&mut self) {
        something();
    }
}

pub mod allocate {
    use super::*;

    pub fn up(
        bump: &Bump<Global, UP_1>,
        layout: Layout,
    ) -> Result<NonNull<[u8]>, std::alloc::AllocError> {
        std::alloc::Allocator::allocate(bump, layout)
    }

    pub fn down(
        bump: &Bump<Global, DOWN_1>,
        layout: Layout,
    ) -> Result<NonNull<[u8]>, std::alloc::AllocError> {
        std::alloc::Allocator::allocate(bump, layout)
    }

    pub fn bumpalo(
        bump: &bumpalo::Bump,
        layout: Layout,
    ) -> Result<NonNull<[u8]>, allocator_api2::alloc::AllocError> {
        allocator_api2::alloc::Allocator::allocate(&bump, layout)
    }

    pub fn blink_alloc(
        bump: &blink_alloc::BlinkAlloc,
        layout: Layout,
    ) -> Result<NonNull<[u8]>, allocator_api2_04::alloc::AllocError> {
        allocator_api2_04::alloc::Allocator::allocate(bump, layout)
    }
}

pub mod deallocate {
    use super::*;

    pub unsafe fn up(bump: &Bump<Global, UP_1>, ptr: NonNull<u8>, layout: Layout) {
        std::alloc::Allocator::deallocate(bump, ptr, layout)
    }

    pub unsafe fn down(bump: &Bump<Global, DOWN_1>, ptr: NonNull<u8>, layout: Layout) {
        std::alloc::Allocator::deallocate(bump, ptr, layout)
    }

    pub unsafe fn bumpalo(bump: &bumpalo::Bump, ptr: NonNull<u8>, layout: Layout) {
        allocator_api2::alloc::Allocator::deallocate(&bump, ptr, layout)
    }

    pub unsafe fn blink_alloc(bump: &blink_alloc::BlinkAlloc, ptr: NonNull<u8>, layout: Layout) {
        allocator_api2_04::alloc::Allocator::deallocate(bump, ptr, layout)
    }
}

pub mod grow {
    use super::*;

    pub unsafe fn up(
        bump: &Bump<Global, UP_1>,
        ptr: NonNull<u8>,
        old_layout: Layout,
        new_layout: Layout,
    ) -> Result<NonNull<[u8]>, std::alloc::AllocError> {
        std::alloc::Allocator::grow(bump, ptr, old_layout, new_layout)
    }

    pub unsafe fn down(
        bump: &Bump<Global, DOWN_1>,
        ptr: NonNull<u8>,
        old_layout: Layout,
        new_layout: Layout,
    ) -> Result<NonNull<[u8]>, std::alloc::AllocError> {
        std::alloc::Allocator::grow(bump, ptr, old_layout, new_layout)
    }

    pub unsafe fn bumpalo(
        bump: &bumpalo::Bump,
        ptr: NonNull<u8>,
        old_layout: Layout,
        new_layout: Layout,
    ) -> Result<NonNull<[u8]>, allocator_api2::alloc::AllocError> {
        allocator_api2::alloc::Allocator::grow(&bump, ptr, old_layout, new_layout)
    }

    pub unsafe fn blink_alloc(
        bump: &blink_alloc::Blink,
        ptr: NonNull<u8>,
        old_layout: Layout,
        new_layout: Layout,
    ) -> Result<NonNull<[u8]>, allocator_api2_04::alloc::AllocError> {
        allocator_api2_04::alloc::Allocator::grow(bump.allocator(), ptr, old_layout, new_layout)
    }
}

pub mod shrink {
    use super::*;

    pub unsafe fn up(
        bump: &Bump<Global, UP_1>,
        ptr: NonNull<u8>,
        old_layout: Layout,
        new_layout: Layout,
    ) -> Result<NonNull<[u8]>, std::alloc::AllocError> {
        std::alloc::Allocator::shrink(bump, ptr, old_layout, new_layout)
    }

    pub unsafe fn down(
        bump: &Bump<Global, DOWN_1>,
        ptr: NonNull<u8>,
        old_layout: Layout,
        new_layout: Layout,
    ) -> Result<NonNull<[u8]>, std::alloc::AllocError> {
        std::alloc::Allocator::shrink(bump, ptr, old_layout, new_layout)
    }

    pub unsafe fn bumpalo(
        bump: &bumpalo::Bump,
        ptr: NonNull<u8>,
        old_layout: Layout,
        new_layout: Layout,
    ) -> Result<NonNull<[u8]>, allocator_api2::alloc::AllocError> {
        allocator_api2::alloc::Allocator::shrink(&bump, ptr, old_layout, new_layout)
    }

    pub unsafe fn blink_alloc(
        bump: &blink_alloc::BlinkAlloc,
        ptr: NonNull<u8>,
        old_layout: Layout,
        new_layout: Layout,
    ) -> Result<NonNull<[u8]>, allocator_api2_04::alloc::AllocError> {
        allocator_api2_04::alloc::Allocator::shrink(bump, ptr, old_layout, new_layout)
    }
}

pub mod alloc_iter_u32 {
    use bump_scope::BumpAllocation;

    use super::*;

    pub fn up<'a>(bump: &'a Bump<Global, UP_1>, slice: &[u32]) -> &'a [u32] {
        bump.alloc_iter(slice.iter().copied()).into_mut()
    }

    pub fn up_a<'a>(bump: &'a Bump<Global, UP_4>, slice: &[u32]) -> &'a [u32] {
        bump.alloc_iter(slice.iter().copied()).into_mut()
    }

    pub fn down<'a>(bump: &'a Bump<Global, DOWN_1>, slice: &[u32]) -> &'a [u32] {
        bump.alloc_iter(slice.iter().copied()).into_mut()
    }

    pub fn down_a<'a>(bump: &'a Bump<Global, DOWN_4>, slice: &[u32]) -> &'a [u32] {
        bump.alloc_iter(slice.iter().copied()).into_mut()
    }

    pub fn exact_up<'a>(bump: &'a Bump<Global, UP_1>, slice: &[u32]) -> &'a [u32] {
        bump.alloc_iter_exact(slice.iter().copied()).into_mut()
    }

    pub fn exact_up_a<'a>(bump: &'a Bump<Global, UP_4>, slice: &[u32]) -> &'a [u32] {
        bump.alloc_iter_exact(slice.iter().copied()).into_mut()
    }

    pub fn exact_down<'a>(bump: &'a Bump<Global, DOWN_1>, slice: &[u32]) -> &'a [u32] {
        bump.alloc_iter_exact(slice.iter().copied()).into_mut()
    }

    pub fn exact_down_a<'a>(bump: &'a Bump<Global, DOWN_4>, slice: &[u32]) -> &'a [u32] {
        bump.alloc_iter_exact(slice.iter().copied()).into_mut()
    }

    pub fn mut_up<'a>(bump: &'a mut Bump<Global, UP_1>, slice: &[u32]) -> &'a [u32] {
        bump.alloc_iter_mut(slice.iter().copied()).into_mut()
    }

    pub fn mut_up_a<'a>(bump: &'a mut Bump<Global, UP_4>, slice: &[u32]) -> &'a [u32] {
        bump.alloc_iter_mut(slice.iter().copied()).into_mut()
    }

    pub fn mut_down<'a>(bump: &'a mut Bump<Global, DOWN_1>, slice: &[u32]) -> &'a [u32] {
        bump.alloc_iter_mut(slice.iter().copied()).into_mut()
    }

    pub fn mut_down_a<'a>(bump: &'a mut Bump<Global, DOWN_4>, slice: &[u32]) -> &'a [u32] {
        bump.alloc_iter_mut(slice.iter().copied()).into_mut()
    }

    pub fn try_up<'a>(bump: &'a Bump<Global, UP_1>, slice: &[u32]) -> Option<&'a [u32]> {
        bump.try_alloc_iter(slice.iter().copied())
            .ok()
            .map(BumpAllocation::into_ref)
    }

    pub fn try_up_a<'a>(bump: &'a Bump<Global, UP_4>, slice: &[u32]) -> Option<&'a [u32]> {
        bump.try_alloc_iter(slice.iter().copied())
            .ok()
            .map(BumpAllocation::into_ref)
    }

    pub fn try_down<'a>(bump: &'a Bump<Global, DOWN_1>, slice: &[u32]) -> Option<&'a [u32]> {
        bump.try_alloc_iter(slice.iter().copied())
            .ok()
            .map(BumpAllocation::into_ref)
    }

    pub fn try_down_a<'a>(bump: &'a Bump<Global, DOWN_4>, slice: &[u32]) -> Option<&'a [u32]> {
        bump.try_alloc_iter(slice.iter().copied())
            .ok()
            .map(BumpAllocation::into_ref)
    }

    pub fn try_exact_up<'a>(bump: &'a Bump<Global, UP_1>, slice: &[u32]) -> Option<&'a [u32]> {
        bump.try_alloc_iter_exact(slice.iter().copied())
            .ok()
            .map(BumpAllocation::into_ref)
    }

    pub fn try_exact_up_a<'a>(bump: &'a Bump<Global, UP_4>, slice: &[u32]) -> Option<&'a [u32]> {
        bump.try_alloc_iter_exact(slice.iter().copied())
            .ok()
            .map(BumpAllocation::into_ref)
    }

    pub fn try_exact_down<'a>(bump: &'a Bump<Global, DOWN_1>, slice: &[u32]) -> Option<&'a [u32]> {
        bump.try_alloc_iter_exact(slice.iter().copied())
            .ok()
            .map(BumpAllocation::into_ref)
    }

    pub fn try_exact_down_a<'a>(
        bump: &'a Bump<Global, DOWN_4>,
        slice: &[u32],
    ) -> Option<&'a [u32]> {
        bump.try_alloc_iter_exact(slice.iter().copied())
            .ok()
            .map(BumpAllocation::into_ref)
    }

    pub fn try_mut_up<'a>(bump: &'a mut Bump<Global, UP_1>, slice: &[u32]) -> Option<&'a [u32]> {
        bump.try_alloc_iter_mut(slice.iter().copied())
            .ok()
            .map(BumpAllocation::into_ref)
    }

    pub fn try_mut_up_a<'a>(bump: &'a mut Bump<Global, UP_4>, slice: &[u32]) -> Option<&'a [u32]> {
        bump.try_alloc_iter_mut(slice.iter().copied())
            .ok()
            .map(BumpAllocation::into_ref)
    }

    pub fn try_mut_down<'a>(
        bump: &'a mut Bump<Global, DOWN_1>,
        slice: &[u32],
    ) -> Option<&'a [u32]> {
        bump.try_alloc_iter_mut(slice.iter().copied())
            .ok()
            .map(BumpAllocation::into_ref)
    }

    pub fn try_mut_down_a<'a>(
        bump: &'a mut Bump<Global, DOWN_4>,
        slice: &[u32],
    ) -> Option<&'a [u32]> {
        bump.try_alloc_iter_mut(slice.iter().copied())
            .ok()
            .map(BumpAllocation::into_ref)
    }

    pub fn bumpalo<'a>(bump: &'a bumpalo::Bump, slice: &[u32]) -> &'a [u32] {
        bump.alloc_slice_fill_iter(slice.iter().copied())
    }

    pub fn std_up<'a>(bump: &'a mut Bump<Global, UP_1>, slice: &[u32]) -> &'a [u32] {
        let mut vec = Vec::new_in(bump);
        vec.extend(slice.iter().copied());
        Box::leak(vec.into_boxed_slice())
    }

    pub fn std_up_a<'a>(bump: &'a mut Bump<Global, UP_4>, slice: &[u32]) -> &'a [u32] {
        let mut vec = Vec::new_in(bump);
        vec.extend(slice.iter().copied());
        Box::leak(vec.into_boxed_slice())
    }

    pub fn std_down<'a>(bump: &'a mut Bump<Global, DOWN_1>, slice: &[u32]) -> &'a [u32] {
        let mut vec = Vec::new_in(bump);
        vec.extend(slice.iter().copied());
        Box::leak(vec.into_boxed_slice())
    }

    pub fn std_down_a<'a>(bump: &'a mut Bump<Global, DOWN_4>, slice: &[u32]) -> &'a [u32] {
        let mut vec = Vec::new_in(bump);
        vec.extend(slice.iter().copied());
        Box::leak(vec.into_boxed_slice())
    }
}

pub mod alloc_fmt {
    use super::*;

    pub fn up<'a>(bump: &'a Bump<Global, UP_1>, display: &str) -> &'a str {
        bump.alloc_fmt(format_args!("begin{display}end")).into_ref()
    }

    pub fn up_a<'a>(bump: &'a Bump<Global, UP_4>, display: &str) -> &'a str {
        bump.alloc_fmt(format_args!("begin{display}end")).into_ref()
    }

    pub fn down<'a>(bump: &'a Bump<Global, DOWN_1>, display: &str) -> &'a str {
        bump.alloc_fmt(format_args!("begin{display}end")).into_ref()
    }

    pub fn down_a<'a>(bump: &'a Bump<Global, DOWN_4>, display: &str) -> &'a str {
        bump.alloc_fmt(format_args!("begin{display}end")).into_ref()
    }

    pub fn mut_up<'a>(bump: &'a mut Bump<Global, UP_1>, display: &str) -> &'a str {
        bump.alloc_fmt_mut(format_args!("begin{display}end"))
            .into_ref()
    }

    pub fn mut_up_a<'a>(bump: &'a mut Bump<Global, UP_4>, display: &str) -> &'a str {
        bump.alloc_fmt_mut(format_args!("begin{display}end"))
            .into_ref()
    }

    pub fn mut_down<'a>(bump: &'a mut Bump<Global, DOWN_1>, display: &str) -> &'a str {
        bump.alloc_fmt_mut(format_args!("begin{display}end"))
            .into_ref()
    }

    pub fn mut_down_a<'a>(bump: &'a mut Bump<Global, DOWN_4>, display: &str) -> &'a str {
        bump.alloc_fmt_mut(format_args!("begin{display}end"))
            .into_ref()
    }

    pub fn try_up<'a>(bump: &'a Bump<Global, UP_1>, display: &str) -> Option<&'a str> {
        bump.try_alloc_fmt(format_args!("begin{display}end"))
            .ok()
            .map(BumpAllocation::into_ref)
    }

    pub fn try_up_a<'a>(bump: &'a Bump<Global, UP_4>, display: &str) -> Option<&'a str> {
        bump.try_alloc_fmt(format_args!("begin{display}end"))
            .ok()
            .map(BumpAllocation::into_ref)
    }

    pub fn try_down<'a>(bump: &'a Bump<Global, DOWN_1>, display: &str) -> Option<&'a str> {
        bump.try_alloc_fmt(format_args!("begin{display}end"))
            .ok()
            .map(BumpAllocation::into_ref)
    }

    pub fn try_down_a<'a>(bump: &'a Bump<Global, DOWN_4>, display: &str) -> Option<&'a str> {
        bump.try_alloc_fmt(format_args!("begin{display}end"))
            .ok()
            .map(BumpAllocation::into_ref)
    }

    pub fn try_mut_up<'a>(bump: &'a mut Bump<Global, UP_1>, display: &str) -> Option<&'a str> {
        bump.try_alloc_fmt_mut(format_args!("begin{display}end"))
            .ok()
            .map(BumpAllocation::into_ref)
    }

    pub fn try_mut_up_a<'a>(bump: &'a mut Bump<Global, UP_4>, display: &str) -> Option<&'a str> {
        bump.try_alloc_fmt_mut(format_args!("begin{display}end"))
            .ok()
            .map(BumpAllocation::into_ref)
    }

    pub fn try_mut_down<'a>(bump: &'a mut Bump<Global, DOWN_1>, display: &str) -> Option<&'a str> {
        bump.try_alloc_fmt_mut(format_args!("begin{display}end"))
            .ok()
            .map(BumpAllocation::into_ref)
    }

    pub fn try_mut_down_a<'a>(
        bump: &'a mut Bump<Global, DOWN_4>,
        display: &str,
    ) -> Option<&'a str> {
        bump.try_alloc_fmt_mut(format_args!("begin{display}end"))
            .ok()
            .map(BumpAllocation::into_ref)
    }
}

pub mod vec_map {
    use super::*;
    use std::{alloc::AllocError, num::NonZeroU32};

    pub fn same(vec: Vec<u32, &Bump>) -> Vec<Option<NonZeroU32>, &Bump> {
        extra::vec_map(vec, NonZeroU32::new)
    }

    pub fn try_same(vec: Vec<u32, &Bump>) -> Result<Vec<Option<NonZeroU32>, &Bump>, AllocError> {
        extra::vec_try_map(vec, NonZeroU32::new)
    }

    pub fn grow(vec: Vec<u32, &Bump>) -> Vec<u64, &Bump> {
        extra::vec_map(vec, |i| i as _)
    }

    pub fn try_grow(vec: Vec<u32, &Bump>) -> Result<Vec<u64, &Bump>, AllocError> {
        extra::vec_try_map(vec, |i| i as _)
    }

    pub fn shrink(vec: Vec<u64, &Bump>) -> Vec<u32, &Bump> {
        extra::vec_map(vec, |i| i as _)
    }

    pub fn try_shrink(vec: Vec<u64, &Bump>) -> Result<Vec<u32, &Bump>, AllocError> {
        extra::vec_try_map(vec, |i| i as _)
    }
}
