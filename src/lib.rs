#![allow(
    non_camel_case_types,
    unused_imports,
    mismatched_lifetime_syntaxes,
    clippy::mut_from_ref,
    clippy::missing_safety_doc
)]

use std::{alloc::Layout, ptr::NonNull};

use bump_scope::BumpBox;

#[derive(Clone, Copy)]
#[repr(align(512))]
#[allow(dead_code)]
pub struct big([u8; 512]);

type vec3 = [u32; 3];

#[derive(Clone, Copy)]
pub struct zst;

type Bump<const MIN_ALIGN: usize, const UP: bool> =
    bump_scope::Bump<bump_scope::alloc::Global, MIN_ALIGN, UP>;
type MutBumpVec<'a, T, const MIN_ALIGN: usize, const UP: bool> =
    bump_scope::MutBumpVec<T, &'a mut Bump<MIN_ALIGN, UP>>;
type MutBumpVecRev<'a, T, const MIN_ALIGN: usize, const UP: bool> =
    bump_scope::MutBumpVecRev<T, &'a mut Bump<MIN_ALIGN, UP>>;

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

                pub fn up$(<$lifetime>)?($bump: &$($lifetime)? Bump<1, true>, $value: $value_ty) -> &$($lifetime)? mut $ty {
                    $body.into_mut()
                }

                pub fn down$(<$lifetime>)?($bump: &$($lifetime)? Bump<1, false>, $value: $value_ty) -> &$($lifetime)? mut $ty {
                    $body.into_mut()
                }

                pub fn up_a$(<$lifetime>)?($bump: &$($lifetime)? Bump<4, true>, $value: $value_ty) -> &$($lifetime)? mut $ty {
                    $body.into_mut()
                }

                pub fn down_a$(<$lifetime>)?($bump: &$($lifetime)? Bump<4, false>, $value: $value_ty) -> &$($lifetime)? mut $ty {
                    $body.into_mut()
                }

                pub fn bumpalo$(<$lifetime>)?($bump: &$($lifetime)? bumpalo::Bump, $value: $value_ty) -> &$($lifetime)? mut $ty {
                    $body
                }

                pub fn bumpalo_a$(<$lifetime>)?($bump: &$($lifetime)? bumpalo::Bump<4>, $value: $value_ty) -> &$($lifetime)? mut $ty {
                    $body
                }

                pub fn try_up$(<$lifetime>)?($bump: &$($lifetime)? Bump<1, true>, $value: $value_ty) -> Option<&$($lifetime)? mut $ty> {
                    $try_body.ok().map(|x| x.into_mut())
                }

                pub fn try_down$(<$lifetime>)?($bump: &$($lifetime)? Bump<1, false>, $value: $value_ty) -> Option<&$($lifetime)? mut $ty> {
                    $try_body.ok().map(|x| x.into_mut())
                }

                pub fn try_up_a$(<$lifetime>)?($bump: &$($lifetime)? Bump<4, true>, $value: $value_ty) -> Option<&$($lifetime)? mut $ty> {
                    $try_body.ok().map(|x| x.into_mut())
                }

                pub fn try_down_a$(<$lifetime>)?($bump: &$($lifetime)? Bump<4, false>, $value: $value_ty) -> Option<&$($lifetime)? mut $ty> {
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

                pub fn up$(<$lifetime>)?(bump: &$($lifetime)? Bump<1, true>, f: fn() -> Result<$ok, $err>) -> Result<&$($lifetime)? mut $ok, $err> {
                    bump.alloc_try_with(f).map(BumpBox::into_mut)
                }

                pub fn down$(<$lifetime>)?(bump: &$($lifetime)? Bump<1, false>, f: fn() -> Result<$ok, $err>) -> Result<&$($lifetime)? mut $ok, $err> {
                    bump.alloc_try_with(f).map(BumpBox::into_mut)
                }

                pub fn try_up$(<$lifetime>)?(bump: &$($lifetime)? Bump<1, true>, f: fn() -> Result<$ok, $err>) -> Option<Result<&$($lifetime)? mut $ok, $err>> {
                    bump.try_alloc_try_with(f).ok().map(|x| x.map(BumpBox::into_mut))
                }

                pub fn try_down$(<$lifetime>)?(bump: &$($lifetime)? Bump<1, false>, f: fn() -> Result<$ok, $err>) -> Option<Result<&$($lifetime)? mut $ok, $err>> {
                    bump.try_alloc_try_with(f).ok().map(|x| x.map(BumpBox::into_mut))
                }

                pub fn up_mut$(<$lifetime>)?(bump: &mut $($lifetime)? Bump<1, true>, f: fn() -> Result<$ok, $err>) -> Result<&$($lifetime)? mut $ok, $err> {
                   bump.alloc_try_with_mut(f).map(BumpBox::into_mut)
                }

                pub fn down_mut$(<$lifetime>)?(bump: &mut $($lifetime)? Bump<1, false>, f: fn() -> Result<$ok, $err>) -> Result<&$($lifetime)? mut $ok, $err> {
                    bump.alloc_try_with_mut(f).map(BumpBox::into_mut)
                }

                pub fn try_up_mut$(<$lifetime>)?(bump: &mut $($lifetime)? Bump<1, true>, f: fn() -> Result<$ok, $err>) -> Option<Result<&$($lifetime)? mut $ok, $err>> {
                    bump.try_alloc_try_with_mut(f).ok().map(|x| x.map(BumpBox::into_mut))
                }

                pub fn try_down_mut$(<$lifetime>)?(bump: &mut $($lifetime)? Bump<1, false>, f: fn() -> Result<$ok, $err>) -> Option<Result<&$($lifetime)? mut $ok, $err>> {
                    bump.try_alloc_try_with_mut(f).ok().map(|x| x.map(BumpBox::into_mut))
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

pub mod alloc_layout {
    use super::*;

    pub fn up(bump: &Bump<1, true>, layout: Layout) -> NonNull<u8> {
        bump.alloc_layout(layout)
    }

    pub fn down(bump: &Bump<1, false>, layout: Layout) -> NonNull<u8> {
        bump.alloc_layout(layout)
    }

    pub fn bumpalo(bump: &bumpalo::Bump, layout: Layout) -> NonNull<u8> {
        bump.alloc_layout(layout)
    }

    pub fn blink_alloc(bump: &blink_alloc::Blink, layout: Layout) -> NonNull<u8> {
        bump.allocator()
            .allocate(layout)
            .map(|ptr| ptr.cast())
            .unwrap()
    }

    pub fn try_up(bump: &Bump<1, true>, layout: Layout) -> Option<NonNull<u8>> {
        bump.try_alloc_layout(layout).ok()
    }

    pub fn try_down(bump: &Bump<1, false>, layout: Layout) -> Option<NonNull<u8>> {
        bump.try_alloc_layout(layout).ok()
    }

    pub fn try_bumpalo(bump: &bumpalo::Bump, layout: Layout) -> Option<NonNull<u8>> {
        bump.try_alloc_layout(layout).ok()
    }

    pub fn try_blink_alloc(bump: &blink_alloc::Blink, layout: Layout) -> Option<NonNull<u8>> {
        bump.allocator().allocate(layout).map(|ptr| ptr.cast()).ok()
    }
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

    pub fn up(bump: &Bump<4, true>, value: [u8; 4]) -> &[u8; 4] {
        bump.alloc(value).into_ref()
    }

    pub fn down(bump: &Bump<4, false>, value: [u8; 4]) -> &[u8; 4] {
        bump.alloc(value).into_ref()
    }

    pub fn down_big(bump: &Bump<4, false>, value: [u8; 40]) -> &[u8; 40] {
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
        bump: &Bump<1, true>,
        layout: Layout,
    ) -> Result<NonNull<[u8]>, bump_scope::alloc::AllocError> {
        bump_scope::alloc::Allocator::allocate(bump, layout)
    }

    pub fn down(
        bump: &Bump<1, false>,
        layout: Layout,
    ) -> Result<NonNull<[u8]>, bump_scope::alloc::AllocError> {
        bump_scope::alloc::Allocator::allocate(bump, layout)
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
    ) -> Result<NonNull<[u8]>, allocator_api2::alloc::AllocError> {
        allocator_api2::alloc::Allocator::allocate(bump, layout)
    }
}

pub mod deallocate {
    use super::*;

    pub unsafe fn up(bump: &Bump<1, true>, ptr: NonNull<u8>, layout: Layout) {
        bump_scope::alloc::Allocator::deallocate(bump, ptr, layout)
    }

    pub unsafe fn down(bump: &Bump<1, false>, ptr: NonNull<u8>, layout: Layout) {
        bump_scope::alloc::Allocator::deallocate(bump, ptr, layout)
    }

    pub unsafe fn bumpalo(bump: &bumpalo::Bump, ptr: NonNull<u8>, layout: Layout) {
        allocator_api2::alloc::Allocator::deallocate(&bump, ptr, layout)
    }

    pub unsafe fn blink_alloc(bump: &blink_alloc::BlinkAlloc, ptr: NonNull<u8>, layout: Layout) {
        allocator_api2::alloc::Allocator::deallocate(bump, ptr, layout)
    }
}

pub mod grow {
    use super::*;

    pub unsafe fn up(
        bump: &Bump<1, true>,
        ptr: NonNull<u8>,
        old_layout: Layout,
        new_layout: Layout,
    ) -> Result<NonNull<[u8]>, bump_scope::alloc::AllocError> {
        bump_scope::alloc::Allocator::grow(bump, ptr, old_layout, new_layout)
    }

    pub unsafe fn down(
        bump: &Bump<1, false>,
        ptr: NonNull<u8>,
        old_layout: Layout,
        new_layout: Layout,
    ) -> Result<NonNull<[u8]>, bump_scope::alloc::AllocError> {
        bump_scope::alloc::Allocator::grow(bump, ptr, old_layout, new_layout)
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
    ) -> Result<NonNull<[u8]>, allocator_api2::alloc::AllocError> {
        allocator_api2::alloc::Allocator::grow(bump.allocator(), ptr, old_layout, new_layout)
    }
}

pub mod shrink {
    use super::*;

    pub unsafe fn up(
        bump: &Bump<1, true>,
        ptr: NonNull<u8>,
        old_layout: Layout,
        new_layout: Layout,
    ) -> Result<NonNull<[u8]>, bump_scope::alloc::AllocError> {
        bump_scope::alloc::Allocator::shrink(bump, ptr, old_layout, new_layout)
    }

    pub unsafe fn down(
        bump: &Bump<1, false>,
        ptr: NonNull<u8>,
        old_layout: Layout,
        new_layout: Layout,
    ) -> Result<NonNull<[u8]>, bump_scope::alloc::AllocError> {
        bump_scope::alloc::Allocator::shrink(bump, ptr, old_layout, new_layout)
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
    ) -> Result<NonNull<[u8]>, allocator_api2::alloc::AllocError> {
        allocator_api2::alloc::Allocator::shrink(bump, ptr, old_layout, new_layout)
    }
}

macro_rules! cases_bump_vec {
    ($vec:ident, $ty:ident, $up:ident) => {
        use super::*;

        pub fn with_capacity(capacity: usize, bump: &mut Bump<1, {$up}>) -> $vec<$ty, 1, {$up}> {
            $vec::with_capacity_in(capacity, bump)
        }

        pub fn push(bump: &mut $vec<$ty, 1, {$up}>, value: $ty) {
            bump.push(value)
        }

        pub fn try_with_capacity(capacity: usize, bump: &mut Bump<1, {$up}>) -> Result<$vec<$ty, 1, {$up}>, bump_scope::alloc::AllocError> {
            $vec::try_with_capacity_in(capacity, bump)
        }

        pub fn try_push(bump: &mut $vec<$ty, 1, {$up}>, value: $ty) -> Result<(), bump_scope::alloc::AllocError> {
            bump.try_push(value)
        }
    };
    ($(mod $mod:ident for $vec:ident $ty:ident)*) => {
        $(
            pub mod $mod {
                use super::*;

                pub mod up {
                    cases_bump_vec!($vec, $ty, true);
                }

                pub mod down {
                    cases_bump_vec!($vec, $ty, false);
                }
            }
        )*
    };
}

cases_bump_vec! {
    mod bump_vec_u32 for MutBumpVec u32
    mod bump_vec_u32_rev for MutBumpVec u32
}

pub mod alloc_iter_u32 {
    use bump_scope::BumpBox;

    use super::*;

    pub fn up<'a>(bump: &'a Bump<1, true>, slice: &[u32]) -> &'a [u32] {
        bump.alloc_iter(slice.iter().copied()).into_mut()
    }

    pub fn up_a<'a>(bump: &'a Bump<4, true>, slice: &[u32]) -> &'a [u32] {
        bump.alloc_iter(slice.iter().copied()).into_mut()
    }

    pub fn down<'a>(bump: &'a Bump<1, false>, slice: &[u32]) -> &'a [u32] {
        bump.alloc_iter(slice.iter().copied()).into_mut()
    }

    pub fn down_a<'a>(bump: &'a Bump<4, false>, slice: &[u32]) -> &'a [u32] {
        bump.alloc_iter(slice.iter().copied()).into_mut()
    }

    pub fn exact_up<'a>(bump: &'a Bump<1, true>, slice: &[u32]) -> &'a [u32] {
        bump.alloc_iter_exact(slice.iter().copied()).into_mut()
    }

    pub fn exact_up_a<'a>(bump: &'a Bump<4, true>, slice: &[u32]) -> &'a [u32] {
        bump.alloc_iter_exact(slice.iter().copied()).into_mut()
    }

    pub fn exact_down<'a>(bump: &'a Bump<1, false>, slice: &[u32]) -> &'a [u32] {
        bump.alloc_iter_exact(slice.iter().copied()).into_mut()
    }

    pub fn exact_down_a<'a>(bump: &'a Bump<4, false>, slice: &[u32]) -> &'a [u32] {
        bump.alloc_iter_exact(slice.iter().copied()).into_mut()
    }

    pub fn mut_up<'a>(bump: &'a mut Bump<1, true>, slice: &[u32]) -> &'a [u32] {
        bump.alloc_iter_mut(slice.iter().copied()).into_mut()
    }

    pub fn mut_up_a<'a>(bump: &'a mut Bump<4, true>, slice: &[u32]) -> &'a [u32] {
        bump.alloc_iter_mut(slice.iter().copied()).into_mut()
    }

    pub fn mut_down<'a>(bump: &'a mut Bump<1, false>, slice: &[u32]) -> &'a [u32] {
        bump.alloc_iter_mut(slice.iter().copied()).into_mut()
    }

    pub fn mut_down_a<'a>(bump: &'a mut Bump<4, false>, slice: &[u32]) -> &'a [u32] {
        bump.alloc_iter_mut(slice.iter().copied()).into_mut()
    }

    pub fn mut_rev_up<'a>(bump: &'a mut Bump<1, true>, slice: &[u32]) -> &'a [u32] {
        bump.alloc_iter_mut_rev(slice.iter().copied()).into_mut()
    }

    pub fn mut_rev_up_a<'a>(bump: &'a mut Bump<4, true>, slice: &[u32]) -> &'a [u32] {
        bump.alloc_iter_mut_rev(slice.iter().copied()).into_mut()
    }

    pub fn mut_rev_down<'a>(bump: &'a mut Bump<1, false>, slice: &[u32]) -> &'a [u32] {
        bump.alloc_iter_mut_rev(slice.iter().copied()).into_mut()
    }

    pub fn mut_rev_down_a<'a>(bump: &'a mut Bump<4, false>, slice: &[u32]) -> &'a [u32] {
        bump.alloc_iter_mut_rev(slice.iter().copied()).into_mut()
    }

    pub fn try_up<'a>(bump: &'a Bump<1, true>, slice: &[u32]) -> Option<&'a [u32]> {
        bump.try_alloc_iter(slice.iter().copied())
            .ok()
            .map(BumpBox::into_ref)
    }

    pub fn try_up_a<'a>(bump: &'a Bump<4, true>, slice: &[u32]) -> Option<&'a [u32]> {
        bump.try_alloc_iter(slice.iter().copied())
            .ok()
            .map(BumpBox::into_ref)
    }

    pub fn try_down<'a>(bump: &'a Bump<1, false>, slice: &[u32]) -> Option<&'a [u32]> {
        bump.try_alloc_iter(slice.iter().copied())
            .ok()
            .map(BumpBox::into_ref)
    }

    pub fn try_down_a<'a>(bump: &'a Bump<4, false>, slice: &[u32]) -> Option<&'a [u32]> {
        bump.try_alloc_iter(slice.iter().copied())
            .ok()
            .map(BumpBox::into_ref)
    }

    pub fn try_exact_up<'a>(bump: &'a Bump<1, true>, slice: &[u32]) -> Option<&'a [u32]> {
        bump.try_alloc_iter_exact(slice.iter().copied())
            .ok()
            .map(BumpBox::into_ref)
    }

    pub fn try_exact_up_a<'a>(bump: &'a Bump<4, true>, slice: &[u32]) -> Option<&'a [u32]> {
        bump.try_alloc_iter_exact(slice.iter().copied())
            .ok()
            .map(BumpBox::into_ref)
    }

    pub fn try_exact_down<'a>(bump: &'a Bump<1, false>, slice: &[u32]) -> Option<&'a [u32]> {
        bump.try_alloc_iter_exact(slice.iter().copied())
            .ok()
            .map(BumpBox::into_ref)
    }

    pub fn try_exact_down_a<'a>(bump: &'a Bump<4, false>, slice: &[u32]) -> Option<&'a [u32]> {
        bump.try_alloc_iter_exact(slice.iter().copied())
            .ok()
            .map(BumpBox::into_ref)
    }

    pub fn try_mut_up<'a>(bump: &'a mut Bump<1, true>, slice: &[u32]) -> Option<&'a [u32]> {
        bump.try_alloc_iter_mut(slice.iter().copied())
            .ok()
            .map(BumpBox::into_ref)
    }

    pub fn try_mut_up_a<'a>(bump: &'a mut Bump<4, true>, slice: &[u32]) -> Option<&'a [u32]> {
        bump.try_alloc_iter_mut(slice.iter().copied())
            .ok()
            .map(BumpBox::into_ref)
    }

    pub fn try_mut_down<'a>(bump: &'a mut Bump<1, false>, slice: &[u32]) -> Option<&'a [u32]> {
        bump.try_alloc_iter_mut(slice.iter().copied())
            .ok()
            .map(BumpBox::into_ref)
    }

    pub fn try_mut_down_a<'a>(bump: &'a mut Bump<4, false>, slice: &[u32]) -> Option<&'a [u32]> {
        bump.try_alloc_iter_mut(slice.iter().copied())
            .ok()
            .map(BumpBox::into_ref)
    }

    pub fn try_mut_rev_up<'a>(bump: &'a mut Bump<1, true>, slice: &[u32]) -> Option<&'a [u32]> {
        bump.try_alloc_iter_mut_rev(slice.iter().copied())
            .ok()
            .map(BumpBox::into_ref)
    }

    pub fn try_mut_rev_up_a<'a>(bump: &'a mut Bump<4, true>, slice: &[u32]) -> Option<&'a [u32]> {
        bump.try_alloc_iter_mut_rev(slice.iter().copied())
            .ok()
            .map(BumpBox::into_ref)
    }

    pub fn try_mut_rev_down<'a>(bump: &'a mut Bump<1, false>, slice: &[u32]) -> Option<&'a [u32]> {
        bump.try_alloc_iter_mut_rev(slice.iter().copied())
            .ok()
            .map(BumpBox::into_ref)
    }

    pub fn try_mut_rev_down_a<'a>(
        bump: &'a mut Bump<4, false>,
        slice: &[u32],
    ) -> Option<&'a [u32]> {
        bump.try_alloc_iter_mut_rev(slice.iter().copied())
            .ok()
            .map(BumpBox::into_ref)
    }

    pub fn bumpalo<'a>(bump: &'a bumpalo::Bump, slice: &[u32]) -> &'a [u32] {
        bump.alloc_slice_fill_iter(slice.iter().copied())
    }
}

pub mod alloc_iter_u32_bump_vec {
    use super::*;

    pub fn up<'a>(bump: &'a mut Bump<1, true>, slice: &[u32]) -> &'a [u32] {
        let mut vec = MutBumpVec::new_in(bump);
        vec.extend(slice.iter().copied());
        vec.into_boxed_slice().into_ref()
    }

    pub fn up_a<'a>(bump: &'a mut Bump<4, true>, slice: &[u32]) -> &'a [u32] {
        let mut vec = MutBumpVec::new_in(bump);
        vec.extend(slice.iter().copied());
        vec.into_boxed_slice().into_ref()
    }

    pub fn down<'a>(bump: &'a mut Bump<1, false>, slice: &[u32]) -> &'a [u32] {
        let mut vec = MutBumpVec::new_in(bump);
        vec.extend(slice.iter().copied());
        vec.into_boxed_slice().into_ref()
    }

    pub fn down_a<'a>(bump: &'a mut Bump<4, false>, slice: &[u32]) -> &'a [u32] {
        let mut vec = MutBumpVec::new_in(bump);
        vec.extend(slice.iter().copied());
        vec.into_boxed_slice().into_ref()
    }

    pub fn rev_up<'a>(bump: &'a mut Bump<1, true>, slice: &[u32]) -> &'a [u32] {
        let mut vec = MutBumpVecRev::new_in(bump);
        vec.extend(slice.iter().copied());
        vec.into_boxed_slice().into_ref()
    }

    pub fn rev_up_a<'a>(bump: &'a mut Bump<4, true>, slice: &[u32]) -> &'a [u32] {
        let mut vec = MutBumpVecRev::new_in(bump);
        vec.extend(slice.iter().copied());
        vec.into_boxed_slice().into_ref()
    }

    pub fn rev_down<'a>(bump: &'a mut Bump<1, false>, slice: &[u32]) -> &'a [u32] {
        let mut vec = MutBumpVecRev::new_in(bump);
        vec.extend(slice.iter().copied());
        vec.into_boxed_slice().into_ref()
    }

    pub fn rev_down_a<'a>(bump: &'a mut Bump<4, false>, slice: &[u32]) -> &'a [u32] {
        let mut vec = MutBumpVecRev::new_in(bump);
        vec.extend(slice.iter().copied());
        vec.into_boxed_slice().into_ref()
    }
}

pub mod alloc_fmt {
    use bump_scope::BumpBox;

    use super::*;

    pub fn up<'a>(bump: &'a Bump<1, true>, display: &str) -> &'a str {
        bump.alloc_fmt(format_args!("begin{display}end")).into_ref()
    }

    pub fn up_a<'a>(bump: &'a Bump<4, true>, display: &str) -> &'a str {
        bump.alloc_fmt(format_args!("begin{display}end")).into_ref()
    }

    pub fn down<'a>(bump: &'a Bump<1, false>, display: &str) -> &'a str {
        bump.alloc_fmt(format_args!("begin{display}end")).into_ref()
    }

    pub fn down_a<'a>(bump: &'a Bump<4, false>, display: &str) -> &'a str {
        bump.alloc_fmt(format_args!("begin{display}end")).into_ref()
    }

    pub fn mut_up<'a>(bump: &'a mut Bump<1, true>, display: &str) -> &'a str {
        bump.alloc_fmt_mut(format_args!("begin{display}end"))
            .into_ref()
    }

    pub fn mut_up_a<'a>(bump: &'a mut Bump<4, true>, display: &str) -> &'a str {
        bump.alloc_fmt_mut(format_args!("begin{display}end"))
            .into_ref()
    }

    pub fn mut_down<'a>(bump: &'a mut Bump<1, false>, display: &str) -> &'a str {
        bump.alloc_fmt_mut(format_args!("begin{display}end"))
            .into_ref()
    }

    pub fn mut_down_a<'a>(bump: &'a mut Bump<4, false>, display: &str) -> &'a str {
        bump.alloc_fmt_mut(format_args!("begin{display}end"))
            .into_ref()
    }

    pub fn try_up<'a>(bump: &'a Bump<1, true>, display: &str) -> Option<&'a str> {
        bump.try_alloc_fmt(format_args!("begin{display}end"))
            .ok()
            .map(BumpBox::into_ref)
    }

    pub fn try_up_a<'a>(bump: &'a Bump<4, true>, display: &str) -> Option<&'a str> {
        bump.try_alloc_fmt(format_args!("begin{display}end"))
            .ok()
            .map(BumpBox::into_ref)
    }

    pub fn try_down<'a>(bump: &'a Bump<1, false>, display: &str) -> Option<&'a str> {
        bump.try_alloc_fmt(format_args!("begin{display}end"))
            .ok()
            .map(BumpBox::into_ref)
    }

    pub fn try_down_a<'a>(bump: &'a Bump<4, false>, display: &str) -> Option<&'a str> {
        bump.try_alloc_fmt(format_args!("begin{display}end"))
            .ok()
            .map(BumpBox::into_ref)
    }

    pub fn try_mut_up<'a>(bump: &'a mut Bump<1, true>, display: &str) -> Option<&'a str> {
        bump.try_alloc_fmt_mut(format_args!("begin{display}end"))
            .ok()
            .map(BumpBox::into_ref)
    }

    pub fn try_mut_up_a<'a>(bump: &'a mut Bump<4, true>, display: &str) -> Option<&'a str> {
        bump.try_alloc_fmt_mut(format_args!("begin{display}end"))
            .ok()
            .map(BumpBox::into_ref)
    }

    pub fn try_mut_down<'a>(bump: &'a mut Bump<1, false>, display: &str) -> Option<&'a str> {
        bump.try_alloc_fmt_mut(format_args!("begin{display}end"))
            .ok()
            .map(BumpBox::into_ref)
    }

    pub fn try_mut_down_a<'a>(bump: &'a mut Bump<4, false>, display: &str) -> Option<&'a str> {
        bump.try_alloc_fmt_mut(format_args!("begin{display}end"))
            .ok()
            .map(BumpBox::into_ref)
    }
}

pub mod vec_map {
    use bump_scope::{alloc::AllocError, Bump};
    use std::num::NonZeroU32;

    type BumpVec<'a, T> = bump_scope::BumpVec<T, &'a Bump>;

    pub fn same(vec: BumpVec<u32>) -> BumpVec<Option<NonZeroU32>> {
        vec.map(NonZeroU32::new)
    }

    pub fn try_same(vec: BumpVec<u32>) -> Result<BumpVec<Option<NonZeroU32>>, AllocError> {
        vec.try_map(NonZeroU32::new)
    }

    pub fn grow(vec: BumpVec<u32>) -> BumpVec<u64> {
        vec.map(|i| i as _)
    }

    pub fn try_grow(vec: BumpVec<u32>) -> Result<BumpVec<u64>, AllocError> {
        vec.try_map(|i| i as _)
    }

    pub fn shrink(vec: BumpVec<u64>) -> BumpVec<u32> {
        vec.map(|i| i as _)
    }

    pub fn try_shrink(vec: BumpVec<u64>) -> Result<BumpVec<u32>, AllocError> {
        vec.try_map(|i| i as _)
    }
}
